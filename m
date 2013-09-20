From: Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Update arch timer node with clock frequency
Date: Fri, 20 Sep 2013 10:55:07 -0400
Message-ID: <523C61CB.2050607@codeaurora.org>
References: <1379499113-20342-1-git-send-email-yuvaraj.cd@samsung.com> <20130918102319.GF26737@e106331-lin.cambridge.arm.com> <CAKuRcOLfRwJohWMhc=QMew87SXtBmkPUJwW7UzNry_gFuC-81Q@mail.gmail.com> <523C048C.10303@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523C048C.10303-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Yuvaraj Kumar <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/20/2013 04:17 AM, Marc Zyngier wrote:
> On 20/09/13 05:57, Yuvaraj Kumar wrote:
>> Resending it as it bounced from kernel mailing group
>>
>> On Wed, Sep 18, 2013 at 3:53 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>>> [adding lakml]
>>>
>>> On Wed, Sep 18, 2013 at 11:11:53AM +0100, Yuvaraj Kumar C D wrote:
>>>> Without the "clock-frequency" property in arch timer node, could able
>>>> to see the below crash dump.
>>>
>>> Why does this cause the below crash specifically? What is CNTFRQ reading
>>> as?
>> Return value of arch_timer_get_cntfrq() is 0
>>>
>>> Your firmware or bootloader should set CNTFRQ -- setting the
>>> clock-frequency is a work-around for buggy firmware/bootloaders that
>>> should be avoided as far as possible.
>> Why kernel should depend on bootloader/firmware  to set CNTFRQ? Any
>> specific reasons?
> 
> Because the kernel can't set it if running non-secure. Only secure mode
> can do this (see the ARM ARM for details).

What software outside the kernel actually reads the CNTFRQ and why?

Thanks,
Christopher

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by the Linux Foundation.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
