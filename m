From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-2 for v3.10
Date: Tue, 21 May 2013 02:11:15 +0900
Message-ID: <519A5933.3040005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36676 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754043Ab3ETRLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 13:11:18 -0400
Received: by mail-pa0-f52.google.com with SMTP id bg2so5867613pad.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 10:11:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-2

for you to fetch changes up to 7ec892ef5f1bd707e2d5ab128069cb6af75c7f07:

   ARM: dts: Enabling samsung-usb2phy driver for exynos5250 (2013-05-21 
01:26:17 +0900)

----------------------------------------------------------------
Fix to get usb2 working on the Chromebook with adding the
usb phy node for usb2 on exynos5250

----------------------------------------------------------------
Vivek Gautam (1):
       ARM: dts: Enabling samsung-usb2phy driver for exynos5250

  arch/arm/boot/dts/exynos5250.dtsi | 15 +++++++++++++++
  1 file changed, 15 insertions(+)
