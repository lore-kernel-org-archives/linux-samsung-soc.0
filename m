From: Inki Dae <inki.dae@samsung.com>
Subject: exynos-drm-next todo work.
Date: Tue, 18 Jun 2013 15:33:25 +0900
Message-ID: <007401ce6bed$bc802920$35807b60$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30026 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544Ab3FRGd3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 02:33:29 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOK00LLHSS3TT20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 15:33:25 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'DRI mailing list' <dri-devel@lists.freedesktop.org>

Hi all,

I'd like to discuss Exynos DRM TODO work.

There are features we have to solve and implement. The purpose of this email
is to share what we have to do so that other guys can be involved without
duplicated work.

1. gscaler based on KMS interfaces - exynos5250 and later use the gscaler
device instead of VP device. And now exynos drm driver has gscaler module as
a sub module of IPP framework. However, this gscaler module is very specific
to IPP framework so it's not easy to reuse this module. So maybe we need so
many works for it.

Video play back path using post process (AS IS):
	MFC--------IPP--------KMS---------FIMD or HDMI

Ideal video play back path using post process (TO BE):
	MFC--------KMS--------FIMD or HDMI

The above scenario is to send decoded image data (YUV format) to display
device via post process. However, we don't really need to use IPP framework
in case of using gscaler as VP. All we have to do is to call kms interface
(setplane) for it like we did before.

2. More features for HDMI sound support - we need to implement Exynos ALSA
SoC DAI driver for HDMI audio (CPU DAI and CODEC DAI). Sampling freq, bit
rate, and so on from user side should be sent to drm hdmi driver via ALSA
interface and the ALSA SoC DAI driver. As of now, it seems like that we
should implement this driver like OMAP does because there is no common
framework for interfacing between ALSA SoC DAI driver and DRM HDMI driver:
in case of OMAP, it seems like that ALSA SoC audio driver calls interfaces
of DSS driver directly. I think we could implement ALSA SoC DAI driver in
more generic way if we first implement common framework for it.

Welcome to any volunteer and other opinions.

Thanks,
Inki Dae
