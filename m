From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: fix null pointer dereference issue
Date: Sun, 23 Nov 2014 00:28:24 +0900
Message-ID: <CAAQKjZMA=_VNzMvnPNkQ2r_s+zHVLiHuDTdqWcJMAAJqNopKjQ@mail.gmail.com>
References: <1415865009-15979-1-git-send-email-inki.dae@samsung.com>
	<1415865009-15979-2-git-send-email-inki.dae@samsung.com>
	<20141120231219.GA3123@joana>
	<546E9F5D.1060203@samsung.com>
	<20141121144111.GC3123@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:33323 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbaKVP2Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 10:28:25 -0500
Received: by mail-la0-f43.google.com with SMTP id q1so5753780lam.16
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2014 07:28:24 -0800 (PST)
In-Reply-To: <20141121144111.GC3123@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: a.hajda@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

2014-11-21 23:41 GMT+09:00 Gustavo Padovan <gustavo@padovan.org>:
> 2014-11-21 Inki Dae <inki.dae@samsung.com>:
>
>> On 2014=B3=E2 11=BF=F9 21=C0=CF 08:12, Gustavo Padovan wrote:
>> > 2014-11-13 Inki Dae <inki.dae@samsung.com>:
>> >
>> >> This patch fixes null pointer dereference issue incurred
>> >> when ipp driver is enabled and Exynos drm driver is closed.
>> >>
>> >> Non kms driver should register its own sub driver to setup necess=
ary
>> >> resources, which is done by load(). So null pointer dereference
>> >> occurs when ipp driver is enabled and Exynos drm driver is closed
>> >> because ipp core device is registered after component_master_add_=
with_match
>> >> call.
>> >>
>> >> This patch makes exynos_drm_device_subdrv_probe() to be called af=
ter all non
>> >> kms drivers are registered.
>> >
>> > This patch is breaking exynos initialization, exynos_drm_device_su=
bdrv_probe()
>> > needs the drvdata but it is still NULL at this point which make th=
e whole
>> > exynos init fails. The drvdata is only set in exynos_drm_load() so=
 we need
>> > call exynos_drm_device_subdrv_probe() after that.
>>
>> There might be my missing point but with this patch,
>> exynos_drm_device_subdrv_probe() will be called after exynos_drm_loa=
d()
>> call because all kms drivers are probed before
>> component_master_add_with_match call so exynos_drm_load() must be ca=
lled
>> by component_master_add_with_match function before
>> exynos_drm_device_subdrv_probe call.
>>
>> So could you show me the error messages you faced with? There might =
be a
>> corner case I missed.
>
> I've added some debug output to it. It fails on
> exynos_drm_device_subdrv_probe() because the drvdata is NULL. I've ad=
ded debug
> output to exynos_drm_load() and as you can see it doesn't get called =
before
> subdrv_probe(). I'm testing this on snow.
>
> [    1.767835] [drm] Initialized drm 1.1.0 20060810
> [    1.771120] [drm:exynos_drm_init]
> [    1.774774] [drm:exynos_drm_platform_probe]
> [    1.778760] platform exynos-drm: Driver exynos-drm requests probe =
deferral
> [    1.786178] platform 145b0000.dp-controller: Driver exynos-dp requ=
ests
> probe deferral
> [    1.794374] exynos-drm-ipp exynos-drm-ipp: drm ipp registered succ=
essfully.
> [    1.800372] [drm:exynos_drm_device_subdrv_probe] dev   (null)
>

Still strange to me. I'd like to reproduce this error because it's
impossible that exynos_drm_device_subdrv_probe is called without load
call.
even If error, this patch must be no problem so in this case, we would
need check if there might be something we missed about component
binding not this patch.
So can you let me know where the git repository is and which defconfig
file did you tested?

Thanks,
Inki Dae

>
>         Gustavo
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
