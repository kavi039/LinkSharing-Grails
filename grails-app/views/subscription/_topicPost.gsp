<div class="panel panel-default " style="height: auto">
    <div class="panel-heading">
        <h3 class="panel-title">Post:${topic.topicName} </h3>
    </div>

    <div class="panel-body">
        <g:each in="${topic.resources}" var="resource">
            <div class="userResources">
                <g:render template="/readingItem/readUnreadUserResources" model="[resource:resource]"/>
            </div>
        </g:each>
    </div>
</div>