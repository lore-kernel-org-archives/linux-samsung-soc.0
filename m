From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 13/14] drm: bridge/analogix_dp: move hpd detect to
 connector detect function
Date: Thu, 20 Aug 2015 03:18:30 -0500
Message-ID: <55D58D56.5070505@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com> <1439995939-18770-1-git-send-email-ykk@rock-chips.com> <6E5CEF9B-19D4-4AC4-B5B1-BC667979302D@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6E5CEF9B-19D4-4AC4-B5B1-BC667979302D-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org" <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, "ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jingoo,

On 08/20/2015 02:49 AM, Jingoo Han wrote:
> On 2015. 8. 19., at PM 11:52, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>
> What is the reason to make this patch?
>
> Please make commit message including the reason.

Okay, I think the below words would be okay :)

"This change just make a little clean to make code more like
drm core expect, move hdp detect code from bridge->enable(),
and place them into connector->detect()."

Thanks,
- Yakir

> Best regards,
> Jingoo Han
>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v3:
>> - move dp hpd detect to connector detect function.
>>
>> Changes in v2: None
>>
>> drivers/gpu/drm/bridge/analogix_dp_core.c | 12 ++++++------
>> 1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix_dp_core.c
>> index 75dd44a..052b9b3 100644
>> --- a/drivers/gpu/drm/bridge/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix_dp_core.c
>> @@ -915,12 +915,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
>>             DRM_ERROR("failed to disable the panel\n");
>>     }
>>
>> -    ret = analogix_dp_detect_hpd(dp);
>> -    if (ret) {
>> -        /* Cable has been disconnected, we're done */
>> -        return;
>> -    }
>> -
>>     ret = analogix_dp_handle_edid(dp);
>>     if (ret) {
>>         dev_err(dp->dev, "unable to handle edid\n");
>> @@ -953,6 +947,12 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
>> static enum drm_connector_status analogix_dp_detect(
>>                 struct drm_connector *connector, bool force)
>> {
>> +    struct analogix_dp_device *dp = connector_to_dp(connector);
>> +
>> +    if (analogix_dp_detect_hpd(dp))
>> +        /* Cable has been disconnected, we're done */
>> +        return connector_status_disconnected;
>> +
>>     return connector_status_connected;
>> }
>>
>> -- 
>> 1.9.1
>>
>>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
