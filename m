From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RESEND PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove
 the OF graph
Date: Thu, 02 Mar 2017 10:44:19 +0900
Message-ID: <a9e52516-bb05-7ad3-01d5-da1fe3bc7548@samsung.com>
References: <CGME20170228081811epcas5p3c0a8151d94511e47a0e0d2b8787b1fb0@epcas5p3.samsung.com>
 <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
 <CAJKOXPfv8wJ+0L4G_0sB1Qh-svXx4VvNJH_1THSy5SsXuUstzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPfv8wJ+0L4G_0sB1Qh-svXx4VvNJH_1THSy5SsXuUstzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Seung Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/28/2017 06:58 PM, Krzysztof Kozlowski wrote:
> On Tue, Feb 28, 2017 at 10:17 AM, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi All,
>>
>> [Resend this v2 patches, because i have missing TO and CC.]
>>
>> The dsi + panel is a parental relationship, so OF grpah is not needed.
>> Therefore, the current dsi_parse_dt function will throw an error,
>> because there is no linked OF graph for case such as fimd + dsi +
>> panel.
>>
>> So the 1/5 patch parse the Pll, burst and esc clock frequency
>> properties in dsi_parse_dt and modified to create a bridge_node only
>> if there is an OF graph associated with dsi.
>>
>> Also fixed the dts, which depend on the 1/5 patch. So removed the
>> ports node and move burst and esc clock frequency properties to the
>> parent (DSI node).
> Discussions in previous thread lead us to bisectability problem.
> Bisectability in regular driver changes is one thing but in case of
> driver + DTS the gap is much bigger. DTS will go through separate tree
> and branches. How do you want to solve the problem?

Sorry for the delay in reply, Mar 1st was the holiday.
I thought of two solutions.

1. squash the patches in a single patch

2. split the dts related patches so that the first part adds the:
+    samsung,burst-clock-frequency = <512000000>;
+    samsung,esc-clock-frequency = <16000000>;

and the second part at the end removes the 'port' node
So it consists of 6 patches in total.

Which do you think is better?
If you have any other ideas, could you tell me?

Best Regards,
Hoegeun

>
> Best regards,
> Krzysztof
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
