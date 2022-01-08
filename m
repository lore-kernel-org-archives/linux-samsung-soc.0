Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A95FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233304AbiAHWFq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 8 Jan 2022 17:05:46 -0500
Received: from h01mx15.reliablemail.org ([173.236.5.211]:32190 "EHLO
        h01mx15.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiAHWFq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 Jan 2022 17:05:46 -0500
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 Jan 2022 17:05:46 EST
X-Halon-Out: 4875790c-70ce-11ec-90dc-00163c81f1a9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ShwrDW4z4GDqIzOjN5Ljw8MomzBvmrs5nZRXEiVBcho=; b=iP4bm7lNgHeCeUIRyvJj1YZ5N5
        HAz54rNFAf6HXqeYGCXYj29gPoLheBTUJFpU4zxarE9GpdeVYPjjD35ZfShuguRPruryLJdKAv7Vf
        LYvvyb8awbwZpw/abRS17gew9HOawws6qUFcjaKkn6z1D+S9uh2fDGBktSiSdTjtDdOe4R6g8Uuk1
        nIYT3caOFEiRuSmToAjfh1r44n2T2C2IGZk0oZap57UuAmyT3XFxFsIFKlNsSgd0x0oC/b46YSmu6
        fJ9REBiO//btqloXEP5FaKS60cPF9zcjYs39C1Y+w0PXoS8xutnybmVmRouk5rDH9/ZbWwyPqdLia
        kat7Cb9w==;
From:   Henrik Grimler <henrik@grimler.se>
To:     linux@armlinux.org.uk, krzysztof.kozlowski@canonical.com,
        m.szyprowski@samsung.com, semen.protsenko@linaro.org,
        martin.juecker@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [RFC PATCH 0/1] ARM: exynos: only do SMC_CMD_CPU1BOOT call on Exynos4
Date:   Sat,  8 Jan 2022 22:57:32 +0100
Message-Id: <20220108215733.705865-1-henrik@grimler.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpsrv07.misshosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grimler.se
X-Get-Message-Sender-Via: cpsrv07.misshosting.com: authenticated_id: henrik@grimler.se
X-Authenticated-Sender: cpsrv07.misshosting.com: henrik@grimler.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I am trying to add support in mainline for a tablet based on Exynos
5420 (Samsung Galaxy Tab S).  For this tablet, CCI has to be disabled,
and with that the device then hangs during

  exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0),

which is run in the cpu_boot secure-firmware function.  If the call is
skipped, then four out of eight CPUs are brought up, which is the same
as on exynos5420-arndale-octa [1] which also has disabled CCI.

Based on Samsung's kernel sources, it seems like the SMC_CMD_CPU1BOOT
call is only needed on Exynos4 and Exynos5250 devices [2], on other
SoC models the call is skipped.  To test if the call seem to do
anything, I booted exynos5422-odroid-xu4 with disabled CCI and with or
without the SMC_CMD_CPU1BOOT call.  The result in both cases were the
same: the first four CPUs were brought up.

To further investigate if the SMC_CMD_CPU1BOOT call is handled we need
to dig into the trustzone firmware.  The trustzone firmware used in
exynos5410-odroid-xu has been to a large part reverse engineered [3],
and by comparing with sboot/tzsw in mainline devices it can be seen
that similar trustzone firmware is used in several.  Out of those, the
SMC_CMD_CPU1BOOT call seem to be only handled in Exynos4 devices.

Here's a table summarising the findings for the mainline devices that
have a secure-firmware node (Exynos3 devices omitted).  An extra 4212
device has been included to get a datapoint for that SoC as well.

.----------------------.--------------.--------------.--------------.
| Device (exynos-)     | Similar tzsw | CPU1BOOT SMC | sboot/tzsw   |
|                      |   to 5410?   |   handled?   |   source     |
.----------------------.--------------.--------------.--------------.
  4212 galaxy tab 3    | yes          | yes          | T310XXSBQB2
  4412-i9300           | yes          | yes          | I9300XXUGPE1
  4412-i9305           | yes          | yes          | I9305XXUFPB1
  4412-itop-elite      | not checked  |              |
  4412-n710x           | not checked  |              |
  4412-odroid{x,x2,u3} | yes          | yes          | wiki.odroid.com/_media/en/boot.tar.gz
  4412-origen          | no           | don't know   | Linaro's origen hwpack 20130130
  4412-p4note-n8010    | not checked  |              |
  4412-trats2          | not checked  |              |
  5410-odroidxu        | yes          | no           | github.com/hsnaves/exynos5410-firmware
  5410-smdk5410        | not checked  |              |
  5420-arndale-octa    | yes          | no           | Linaro's arndale-octa hwpack 20140323
  5422-odroid-xu{3,4}  | yes          | no           | Hardkernel's u-boot 2020.01 branch

"Similar tzsw" above means that the secure monitor calls seem to be
handled in the same way as for exynos5410-odroid-xu, in a quite
easy-to-spot function (see patch for what it looks like).

For the tablet I am actually interested in, the trustzone firmware
looks very different, and I have not been able to locate where/how the
secure monitor calls are handled.

Nevertheless, since the call seem to only be handled in trustzone
firmware for Exynos4, and since exynos5422-odroid-xu4 behaves the same
with or without this secure monitor call, I *think* it should be safe
to only run it on the devices where we know that it is handled.

[1] https://krzk.eu/#/builders/32
[2] https://github.com/LineageOS/android_kernel_samsung_exynos5420/blob/cm-14.1/arch/arm/mach-exynos/platsmp.c#L225-L229
[3] https://github.com/hsnaves/exynos5410-firmware

Henrik Grimler (1):
  ARM: exynos: only do SMC_CMD_CPU1BOOT call on Exynos4

 arch/arm/mach-exynos/firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


base-commit: 3e4d9032d1a223488456f82d05cfe5519962f344
prerequisite-patch-id: f0f30752eb24b3515eee0a8d7bcf043e2cb084ad
-- 
2.34.1

