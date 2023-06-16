Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82E5EB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jun 2023 03:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241806AbjFPDLu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Jun 2023 23:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241838AbjFPDLo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Jun 2023 23:11:44 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB573AB9;
        Thu, 15 Jun 2023 20:11:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977ed383b8aso25720166b.3;
        Thu, 15 Jun 2023 20:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686885074; x=1689477074;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LOjiPl/w2ayQkimknX6QAL0LNtlZjtZfLxAHMlGMa1E=;
        b=i9Ali3yKqphzi75SHKLG/MF2W2IhsrVvDgWVK827y7FPuQ9NcYy13FrN3O23jpObMZ
         YfpB76+fvifK9yPUUlNTAtJqfh4VtOPtmcs9Qjp9MlaumWhP9sa01t9bRnd5UKYYoTto
         BmcnttBAAb/Cvfk0weZu/Zw8W5GP20hzDDjo1JrBSIWw9xjkheHc6hrTtodhtBYs5K1h
         OP0BhHTeCKLRZ2P2keBaVa9EPFha2ctL0B/X3oGlf6pLUtYLdZQNhM7klrZzahm0RNei
         umY8+pVvJpHIRe1EJtiIDZh/At9rSn03bi6kOWlZxp1WH0LXndA/NyvsYBPxkBPbj8k/
         6wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686885074; x=1689477074;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOjiPl/w2ayQkimknX6QAL0LNtlZjtZfLxAHMlGMa1E=;
        b=OmZJYuw+jJY4iUyPDHoAnPUlrE0Aq94Z7t6qH98wMv8K+p06q827YDC6o8XtKdZT0R
         Iz1SvY3g6HYyETJv1/stbh+oFxmIObf40ay/kZtUngTCiWdMYNJon5eaWeNGPtAkUqAf
         cNm8L9fjgJmSLOEWW8qOVJgwtcNM2BGz2xUGKrdc0DUqoc2qK1/yxaWLswm0Enzix4Ef
         k6R69JMIugEtdxJ3xBEddpbnbRgVdTqVgH8hv5VnklpgzoBKzmdZ6i+TRHmekpcXQeRb
         tTB/3F0VpL2NQ67y8pqfbWd+X/fMq624ugFBXNluFUIjdI/jI9HApiBlh/R4uan0h0WB
         vOzw==
X-Gm-Message-State: AC+VfDwFCXEKpNPYqLa+0zU7wwNXgWDXLnMJ+m2i8Tf5lIb9N48FkBLI
        ui9XXfdlWot7OYWTiv6fl6DcuCC5yPCDSw==
X-Google-Smtp-Source: ACHHUZ46kwl7QHTRT2buq53HKhqToh0jRhSlNeLfnRRNzvguWviN27Lra0XBCnms91KQEIXLfag5wA==
X-Received: by 2002:a17:907:783:b0:982:c8d0:683f with SMTP id xd3-20020a170907078300b00982c8d0683fmr692771ejb.18.1686885073602;
        Thu, 15 Jun 2023 20:11:13 -0700 (PDT)
Received: from [10.0.0.102] (snat-11.cgn.sat-an.net. [176.222.226.11])
        by smtp.gmail.com with ESMTPSA id s24-20020a1709060c1800b00969f25b96basm10073357ejf.204.2023.06.15.20.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 20:11:12 -0700 (PDT)
Message-ID: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
Subject: usb: dwc3: HC dies under high I/O load on Exynos5422
From:   Jakub =?UTF-8?Q?Van=C4=9Bk?= <linuxtardis@gmail.com>
To:     Thinh.Nguyen@synopsys.com, krzysztof.kozlowski@linaro.org,
        mauro.ribeiro@hardkernel.com
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Fri, 16 Jun 2023 05:11:11 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi all,

I've discovered that on recent kernels the xHCI controller on Odroid
HC2 dies when a USB-attached disk is put under a heavy I/O load.

The hardware in question is using a DWC3 2.00a IP within the Exynos5422
to provide two internal USB3 ports. One of them is connected to a
JMS578 USB-to-SATA bridge (Odroid firmware v173.01.00.02). The bridge
is then connected to a Intel SSDSC2KG240G8 (firmware XCV10132).

The crash can be triggered by running a read-heavy workload. This
triggers it for me within tens of seconds:

$ fio --filename=3D/dev/sda --direct=3D1 --rw=3Dread --bs=3D4k \
 --ioengine=3Dlibaio --iodepth=3D256 --runtime=3D120 --numjobs=3D4 \
 --time_based --group_reporting --name=3Diops-test-job \
 --eta-newline=3D1 --readonly

FIO output then follows this pattern:

iops-test-job: (g=3D0): rw=3Dread, bs=3D(R) 4096B-4096B, (W) 4096B-4096B, (=
T)
4096B-4096B, ioengine=3Dlibaio, iodepth=3D256
...
fio-3.16
Starting 4 processes
Jobs: 4 (f=3D4): [R(4)][2.5%][r=3D341MiB/s][r=3D87.2k IOPS][eta 01m:57s]
Jobs: 4 (f=3D4): [R(4)][4.2%][r=3D340MiB/s][r=3D87.1k IOPS][eta 01m:55s]
Jobs: 4 (f=3D4): [R(4)][5.8%][r=3D337MiB/s][r=3D86.2k IOPS][eta 01m:53s]
Jobs: 4 (f=3D4): [R(4)][7.5%][r=3D369MiB/s][r=3D94.5k IOPS][eta 01m:51s]
Jobs: 4 (f=3D4): [R(4)][9.2%][r=3D364MiB/s][r=3D93.2k IOPS][eta 01m:49s]
Jobs: 4 (f=3D4): [R(4)][10.8%][r=3D363MiB/s][r=3D92.9k IOPS][eta 01m:47s]
Jobs: 4 (f=3D4): [R(4)][12.5%][r=3D348MiB/s][r=3D88.0k IOPS][eta 01m:45s]
Jobs: 4 (f=3D4): [R(4)][14.2%][r=3D348MiB/s][r=3D88.0k IOPS][eta 01m:43s]
Jobs: 4 (f=3D4): [R(4)][15.8%][r=3D377MiB/s][r=3D96.4k IOPS][eta 01m:41s]
Jobs: 4 (f=3D4): [R(4)][17.5%][r=3D372MiB/s][r=3D95.2k IOPS][eta 01m:39s]
Jobs: 4 (f=3D4): [R(4)][18.3%][r=3D77.0MiB/s][r=3D19.0k IOPS][eta 01m:38s]
Jobs: 4 (f=3D4): [R(4)][20.0%][eta 01m:36s]
< line without progress repeated many times; xHC is now unresponsive >
Jobs: 4 (f=3D4): [R(4)][45.8%][eta 01m:05s]
fio: io_u error on file /dev/sda: No such device: read
offset=3D1820839936, buflen=3D4096
fio: pid=3D1863, err=3D19/file:io_u.c:1787, func=3Dio_u error, error=3DNo s=
uch
device
< and so on >

Dmesg contains the following output:

[ 266.310767] xhci-hcd xhci-hcd.8.auto: xHCI host controller not
responding, assume dead
[ 266.317388] xhci-hcd xhci-hcd.8.auto: HC died; cleaning up
[ 266.322710] usb 4-1: cmd cmplt err -108
[ 266.326497] usb 4-1: cmd cmplt err -108
[ 266.330313] usb 4-1: cmd cmplt err -108
[ 266.334096] usb 4-1: cmd cmplt err -108
[ 266.337942] usb 4-1: cmd cmplt err -108
[ 266.341746] usb 4-1: cmd cmplt err -108
[ 266.345561] usb 4-1: cmd cmplt err -108
[ 266.349372] usb 4-1: cmd cmplt err -108
[ 266.353187] usb 4-1: cmd cmplt err -108
[ 266.357000] usb 4-1: cmd cmplt err -108
[ 266.360809] usb 4-1: cmd cmplt err -108
[ 266.364626] usb 4-1: cmd cmplt err -108
[ 266.368439] usb 4-1: cmd cmplt err -108
[ 266.372248] usb 4-1: cmd cmplt err -108
[ 266.376063] usb 4-1: cmd cmplt err -108
[ 266.379876] usb 4-1: cmd cmplt err -108
[ 266.383688] usb 4-1: cmd cmplt err -108
[ 266.387500] usb 4-1: cmd cmplt err -108
[ 266.391314] usb 4-1: cmd cmplt err -108
[ 266.395127] usb 4-1: cmd cmplt err -108
[ 266.398943] usb 4-1: cmd cmplt err -108
[ 266.402753] usb 4-1: cmd cmplt err -108
[ 266.406565] usb 4-1: cmd cmplt err -108
[ 266.410379] usb 4-1: cmd cmplt err -108
[ 266.414165] usb 4-1: cmd cmplt err -108
[ 266.418003] usb 4-1: cmd cmplt err -108
[ 266.448629] BTRFS error (device sda2): bdev /dev/sda2 errs: wr 0, rd
1, flush 0, corrupt 0, gen 0
< more FS errors follow >

The OS is then unable to recover (I have rootfs on that SSD too) and
the board must be manually restarted.

I can reproduce the problem on mainline 6.4-rc6 with multi_v7_defconfig
(+ CONFIG_BTRFS=3Dy for the rootfs). I've bisected the problem a while
back and the first broken commit is b138e23d3dff ("usb: dwc3: core:
Enable AutoRetry feature in the controller"). Reverting this commit
locally makes my board stable again (FIO test above can run
for >10 minutes without any issues).

The crash is happening when the USB-SATA bridge is controlled by the
uas driver. I have not tested the usb-storage driver yet.

What do you think would be an appropriate fix here? One idea I had is
to add a Odroid-specific quirk to DWC3 to not enable AutoRetry here.
However, I'm not entirely sure this is isolated to Odroid boards.

Please let me know if you need me to do some more experiments.

Thank you,

Jakub Vanek
