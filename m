From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCHv2 4/4] s5p-cec: add hpd-notifier support,
 move out of staging
Date: Wed, 04 Jan 2017 09:44:20 +0100
Message-ID: <ac040a2a-f6f4-cd6d-05a7-54bc2a8b7e86@samsung.com>
References: <1483366747-34288-1-git-send-email-hverkuil@xs4all.nl>
 <CGME20170102141935epcas1p3b093bcf648e1fa5873683cea60803f60@epcas1p3.samsung.com>
 <1483366747-34288-5-git-send-email-hverkuil@xs4all.nl>
 <4dd103b4-6f9b-8ef5-540e-6c5673b82c98@samsung.com>
 <9652e8a9-1f5e-eadd-e588-b3051b0a8eb3@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <9652e8a9-1f5e-eadd-e588-b3051b0a8eb3@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03.01.2017 09:11, Hans Verkuil wrote:
> On 01/03/2017 09:00 AM, Andrzej Hajda wrote:
>> Is there a reason to split registration into two steps?
>> Wouldn't be better to integrate hpd_notifier_get into
>> cec_register_hpd_notifier.
> One problem is that hpd_notifier_get can fail, whereas cec_register_hpd_notifier can't.
> And I rather not have to register a CEC device only to unregister it again if the
> hpd_notifier_get would fail.

hpd_notifier_get can fail only due to lack of memory for about 150 bytes
so if it happens whole system will probably fail anyway :)


>
> Another reason is that this keeps the responsibility of the hpd_notifier life-time
> handling in the driver instead of hiding it in the CEC framework, which is IMHO
> unexpected.

Notifier is used only by CEC framework, so IMHO it would be desirable to
put CEC specific things into CEC framework.
Drivers duty is just to find notifier device.
Leaving it as is will just put little more burden on drivers, so this is
not big deal, do as you wish :)

Regards
Andrzej

>
> I think I want to keep this as-is, at least for now.
>
> Regards,
>
> 	Hans
>
>
>
>
