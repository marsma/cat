<%@ page session="false" language="java" pageEncoding="UTF-8" %>
<h3 class="text-error">业务监控接入文档</h3>
</br>
<h4 class="text-info">强调两个名词，业务监控以及业务分析</h4>
<h5>a).业务分析，产品线有很多指标，来确定产品是否能满足用户需求，这部分DW在负责。</h5>
<h5>b).业务监控，它关注于最重要的业务指标，业务监控目的是快速发现业务是否存在问题，一旦出现问题，这类问题对于业务的影响有多大。</h5>
<h5>c).业务监控和业务分析有部分的交叉，业务监控数据可能是不准确的，比如销售额，他仅仅用于监控，用于发现业务是否正常。建议产品线的核心指标不超过6个。</h5>

</br>
<h4 class="text-success">第一步:确定业务指标</h4>
<h4 class="text-error">1).每个指标都有一个String作为它的唯一KEY，这个KEY在整个产品线中，不能重复。产品线的配置参考第三步。</h4>
<p>比如团购业务中，有两个核心指标，一个订单数量，一个是销售总金额</p>
<p>对这两个指标定义两个唯一的String，PayCount 和 PayAmount</p>
</br>

<h4 class="text-success">第二步:业务代码埋点</h4>
<h5 class='text-error'> Metric一共有三个API，分别用来记录次数、平均、总和，统一粒度为一分钟</h5>
<p> 1).logMetricForCount用于记录一个指标值出现的次数</p>
<p> 2).logMetricForDuration用于记录一个指标出现的平均值</p>
<p> 3).logMetricForSum用于记录一个指标出现的总和</p>
<p class='text-error'> 4).PayCount记录次数选用logMetricForCount这个API，PayAmount记录总和选用logMetricForSum这个API</p>
<p> 5).集成代码可能是如下所示</p>
<img  class="img-polaroid"  width='60%' src="${model.webapp}/images/business04.png"/>

</br>
</br> 
<h4 class="text-success">第三步:产品线配置</h4>
<p>业务监控展示的是一个产品线下所有的业务指标信息，CAT提供了产品的配置信息</p>
<p><span class='text-error'>必须把一个产品线下的所有项目加入到此产品线，这样这个产品线下所有指标才能正确展示</span></p>
<h4 class="text-error">url : <a href="" target="_blank">链接</a></h4>
<img  class="img-polaroid"  width='60%' src="${model.webapp}/images/business01.png"/>
</br> 
<h4 class="text-success">第四步:图形展示配置</h4>
<p>当程序埋点好，后端的Metric指标的数据都是自动插入到CAT数据库中，不需要用户进行新建业务指标，用户直接修改即可。</p>
<p>此时已经能展示基本的业务监控曲线，如果需要一些其他的配置，比如业务监控图形顺序，展示标题等。</p>
<h4 class="text-error">url : <a href="/cat/s/config?op=metricConfigList" target="_blank">链接</a></h4>
<img  class="img-polaroid"  width='60%' src="${model.webapp}/images/business02.png"/>
</br> 
<h4 class="text-success">第五步:配置公司级别业务大盘【运维配置】</h4>
<p>业务大盘讲各个产品线重要的业务指标进行汇总，统一展示在一个监控大盘中。</p>
<h4 class="text-error">url : <a href="/cat/s/config?op=metricConfigList" target="_blank">链接</a></h4>
<img  class="img-polaroid"  width='60%' src="${model.webapp}/images/business03.png"/>


