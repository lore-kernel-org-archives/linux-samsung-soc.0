Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7C6EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Jun 2023 15:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjFXP6J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 24 Jun 2023 11:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjFXP6H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Jun 2023 11:58:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304CF1BC;
        Sat, 24 Jun 2023 08:58:06 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51a3e6a952aso1828843a12.3;
        Sat, 24 Jun 2023 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687622284; x=1690214284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=af5sNaEfT2WsVEbo8gNhqs1xjknzebzp7aYfsrzZz+s=;
        b=NhevF0x1ISN8V5b+I21bdtjLvKwalfaP20saNfX2BjXpob/IRaEul5CdIZ3OC4tMmm
         79a0m5qwY+6219cpt9bVXhg+Mdnk/lVAtu9wVPjOa31OAm4/B5NWvernKfyO3CCPYWqQ
         Z91vNKcrlFQJLLEsihr86F5P9c7KLaYnyYGupC307xRohxhWkmGQiLBvKt9looicRiKk
         m3brPDeD0VgbQsGvHlqh5dyVXlSTE/5Uf1YDd0AwXUXrikNDdN3ZGN9urBuIauiNvZKd
         cavXe1MoyrO7XQddYSZeBMyufNoDXVqjI6dgOnNePxrUGSL+xBtTYsApArUrYieKHvdu
         s3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687622284; x=1690214284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af5sNaEfT2WsVEbo8gNhqs1xjknzebzp7aYfsrzZz+s=;
        b=InXBlZYU3fU59NUoecJ5DE7aWY5kSexHLELTEQCPosTggqca3nB+uzPr1rneiL79y9
         SGjTDQxCgzD7uwsv0Sm7LUojBwDs3tC8InbShUWDlTgb8kfefhn4++WEM7Cr6Gs5Z61/
         xwPk2fxCjGymyUAo0skkM4EpKODDYsW59OUf7eaIGKWOThde3cAx0ckLMZzyNvGiO2l7
         wLTFmG+AsVDdGMAbcsxJV4Coz0CacP6Tzs07TzOU5jmtpNeX7q1fFHKa6dR1mPJ49LH4
         NW872Pk3XUF5fL+dNpkbkDpwZdoBdzoZCHgvfJUjOdgrgkzZAKbefB/8ie5n9SmFzZi4
         L4Og==
X-Gm-Message-State: AC+VfDwQT1/Y0ncLz/SLSmHQiMQieLmQtbMPNCv0+kHADGhxddgPqBsV
        /7eDPUwtbBwwbDtbKczAhrk=
X-Google-Smtp-Source: ACHHUZ4swIuWK1/dOKJBy9BRtNkSir0aqDEeM2+GP/T80XkI4ubaY5f5gUaP32Y8wuMOYwOl9fzbUg==
X-Received: by 2002:a17:907:9306:b0:97f:3d6f:93b8 with SMTP id bu6-20020a170907930600b0097f3d6f93b8mr21385036ejc.43.1687622283944;
        Sat, 24 Jun 2023 08:58:03 -0700 (PDT)
Received: from [10.0.0.102] (snat-11.cgn.sat-an.net. [176.222.226.11])
        by smtp.gmail.com with ESMTPSA id qo5-20020a170907212500b00988c93c85a5sm998215ejb.183.2023.06.24.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 08:58:03 -0700 (PDT)
Message-ID: <f76fe9831beb9dce2f4f0d5f5055dfd4f67b5000.camel@gmail.com>
Subject: Re: usb: dwc3: HC dies under high I/O load on Exynos5422
From:   Jakub =?iso-8859-2?Q?Van=ECk?= <linuxtardis@gmail.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "mauro.ribeiro@hardkernel.com" <mauro.ribeiro@hardkernel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Date:   Sat, 24 Jun 2023 17:58:02 +0200
In-Reply-To: <20230622223255.xawjfenb2tsjdmmg@synopsys.com>
References: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
         <20230622223255.xawjfenb2tsjdmmg@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Thinh,

thank you for your reply!

On Thu, 2023-06-22 at 22:33 +0000, Thinh Nguyen wrote:
> Sorry for the delay in response. I was away.
>=20
> On Fri, Jun 16, 2023, Jakub Van=C4=9Bk wrote:
> > Hi all,
> >=20
> > I've discovered that on recent kernels the xHCI controller on Odroid
> > HC2 dies when a USB-attached disk is put under a heavy I/O load.
> >=20
> > The hardware in question is using a DWC3 2.00a IP within the Exynos5422
>=20
> Just want to clarify, this is dwc_usb3 v2.00a and not dwc_usb31.

Indeed, I forgot to add this.

> > to provide two internal USB3 ports. One of them is connected to a
> > JMS578 USB-to-SATA bridge (Odroid firmware v173.01.00.02). The bridge
> > is then connected to a Intel SSDSC2KG240G8 (firmware XCV10132).
> >=20
> > The crash can be triggered by running a read-heavy workload. This
> > triggers it for me within tens of seconds:
> >=20
> > $ fio --filename=3D/dev/sda --direct=3D1 --rw=3Dread --bs=3D4k \
> > =C2=A0--ioengine=3Dlibaio --iodepth=3D256 --runtime=3D120 --numjobs=3D4=
 \
> > =C2=A0--time_based --group_reporting --name=3Diops-test-job \
> > =C2=A0--eta-newline=3D1 --readonly
> >=20
> > FIO output then follows this pattern:
> >=20
> > iops-test-job: (g=3D0): rw=3Dread, bs=3D(R) 4096B-4096B, (W) 4096B-4096=
B, (T)
> > 4096B-4096B, ioengine=3Dlibaio, iodepth=3D256
> > ...
> > fio-3.16
> > Starting 4 processes
> > Jobs: 4 (f=3D4): [R(4)][2.5%][r=3D341MiB/s][r=3D87.2k IOPS][eta 01m:57s=
]
> > Jobs: 4 (f=3D4): [R(4)][4.2%][r=3D340MiB/s][r=3D87.1k IOPS][eta 01m:55s=
]
> > Jobs: 4 (f=3D4): [R(4)][5.8%][r=3D337MiB/s][r=3D86.2k IOPS][eta 01m:53s=
]
> > Jobs: 4 (f=3D4): [R(4)][7.5%][r=3D369MiB/s][r=3D94.5k IOPS][eta 01m:51s=
]
> > Jobs: 4 (f=3D4): [R(4)][9.2%][r=3D364MiB/s][r=3D93.2k IOPS][eta 01m:49s=
]
> > Jobs: 4 (f=3D4): [R(4)][10.8%][r=3D363MiB/s][r=3D92.9k IOPS][eta 01m:47=
s]
> > Jobs: 4 (f=3D4): [R(4)][12.5%][r=3D348MiB/s][r=3D88.0k IOPS][eta 01m:45=
s]
> > Jobs: 4 (f=3D4): [R(4)][14.2%][r=3D348MiB/s][r=3D88.0k IOPS][eta 01m:43=
s]
> > Jobs: 4 (f=3D4): [R(4)][15.8%][r=3D377MiB/s][r=3D96.4k IOPS][eta 01m:41=
s]
> > Jobs: 4 (f=3D4): [R(4)][17.5%][r=3D372MiB/s][r=3D95.2k IOPS][eta 01m:39=
s]
> > Jobs: 4 (f=3D4): [R(4)][18.3%][r=3D77.0MiB/s][r=3D19.0k IOPS][eta 01m:3=
8s]
> > Jobs: 4 (f=3D4): [R(4)][20.0%][eta 01m:36s]
> > < line without progress repeated many times; xHC is now unresponsive >
> > Jobs: 4 (f=3D4): [R(4)][45.8%][eta 01m:05s]
> > fio: io_u error on file /dev/sda: No such device: read
> > offset=3D1820839936, buflen=3D4096
> > fio: pid=3D1863, err=3D19/file:io_u.c:1787, func=3Dio_u error, error=3D=
No such
> > device
> > < and so on >
> >=20
> > Dmesg contains the following output:
> >=20
> > [ 266.310767] xhci-hcd xhci-hcd.8.auto: xHCI host controller not
> > responding, assume dead
> > [ 266.317388] xhci-hcd xhci-hcd.8.auto: HC died; cleaning up
> > [ 266.322710] usb 4-1: cmd cmplt err -108
> > [ 266.326497] usb 4-1: cmd cmplt err -108
> > [ 266.330313] usb 4-1: cmd cmplt err -108
> > [ 266.334096] usb 4-1: cmd cmplt err -108
> > [ 266.337942] usb 4-1: cmd cmplt err -108
> > [ 266.341746] usb 4-1: cmd cmplt err -108
> > [ 266.345561] usb 4-1: cmd cmplt err -108
> > [ 266.349372] usb 4-1: cmd cmplt err -108
> > [ 266.353187] usb 4-1: cmd cmplt err -108
> > [ 266.357000] usb 4-1: cmd cmplt err -108
> > [ 266.360809] usb 4-1: cmd cmplt err -108
> > [ 266.364626] usb 4-1: cmd cmplt err -108
> > [ 266.368439] usb 4-1: cmd cmplt err -108
> > [ 266.372248] usb 4-1: cmd cmplt err -108
> > [ 266.376063] usb 4-1: cmd cmplt err -108
> > [ 266.379876] usb 4-1: cmd cmplt err -108
> > [ 266.383688] usb 4-1: cmd cmplt err -108
> > [ 266.387500] usb 4-1: cmd cmplt err -108
> > [ 266.391314] usb 4-1: cmd cmplt err -108
> > [ 266.395127] usb 4-1: cmd cmplt err -108
> > [ 266.398943] usb 4-1: cmd cmplt err -108
> > [ 266.402753] usb 4-1: cmd cmplt err -108
> > [ 266.406565] usb 4-1: cmd cmplt err -108
> > [ 266.410379] usb 4-1: cmd cmplt err -108
> > [ 266.414165] usb 4-1: cmd cmplt err -108
> > [ 266.418003] usb 4-1: cmd cmplt err -108
> > [ 266.448629] BTRFS error (device sda2): bdev /dev/sda2 errs: wr 0, rd
> > 1, flush 0, corrupt 0, gen 0
> > < more FS errors follow >
> >=20
> > The OS is then unable to recover (I have rootfs on that SSD too) and
> > the board must be manually restarted.
> >=20
> > I can reproduce the problem on mainline 6.4-rc6 with multi_v7_defconfig
> > (+ CONFIG_BTRFS=3Dy for the rootfs). I've bisected the problem a while
> > back and the first broken commit is b138e23d3dff ("usb: dwc3: core:
> > Enable AutoRetry feature in the controller"). Reverting this commit
> > locally makes my board stable again (FIO test above can run
> > for >10 minutes without any issues).
>=20
> This info helps a lot.
>=20
> >=20
> > The crash is happening when the USB-SATA bridge is controlled by the
> > uas driver. I have not tested the usb-storage driver yet.
> >=20
> > What do you think would be an appropriate fix here? One idea I had is
> > to add a Odroid-specific quirk to DWC3 to not enable AutoRetry here.
> > However, I'm not entirely sure this is isolated to Odroid boards.
> >=20
> > Please let me know if you need me to do some more experiments.
> >=20
>=20
> This failure indicates that whichever device you're testing against
> could not retry with burst (NumP !=3D 0) after a CRC error. After a perio=
d
> of time, the host timed out and attempted to restore its operations by
> stoping the active transfers with a Stop-ep command. However, for some
> reason, the host doesn't respond to this command. The crash you observed
> is probably a separate issue. The main issue is why the host doesn't
> receive a command completion event. If you're our direct customer, you
> can submit a STAR request for our support. I'm not aware of this type of
> failure related to AutoRetry. However, given how old this controller
> version is (over a decade ago), I can't be sure.

Thank you, this explanations makes sense to me.

> I think if you try to test against a different device, you may not
> observe this same failure.

I can partially confirm this. There is a USB3 to 1Gbit Ethernet bridge
onboard too and this peripheral appears to work reliably. I am unable
to test a different USB-to-SATA bridge though - there are no physical
USB3 ports on Odroid HC2. It would be possible to verify this on Odroid
XU4 which uses the same chip and does have physical USB ports. However,
I don't have one at hand now.

> To resolve this, please look into our support team to investigate
> further to see whether it's a setup issue. Otherwise, we can disable
> this feature for dwc_usb3 v2.00a. Depending on how bad the CRC error
> rate is (which should be low), this should not affect performance
> much.

I unfortunately have no relationship with either Synopsys, Samsung or
Hardkernel. Would you be OK with me submitting the proposed patch even
without further investigation? Also, can I submit this for backporting
to -stable?

> I don't think this neccessarily needs a new DT property.
>=20
> Something like this:
>=20
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 0beaab932e7d..1bfd8b127240 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1209,8 +1209,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dwc->dr_mode =3D=3D USB_DR=
_MODE_HOST ||
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dwc->dr_mod=
e =3D=3D USB_DR_MODE_OTG) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!DWC3_VER_IS(DWC3, 200A) &=
&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dwc->dr_mo=
de =3D=3D USB_DR_MODE_HOST ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dwc->=
dr_mode =3D=3D USB_DR_MODE_OTG)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0reg =3D dwc3_readl(dwc->regs, DWC3_GUCTL);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/*
>=20

> Thanks,
> Thinh

Thank you,
Jakub
