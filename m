From: Paolo Pisati <p.pisati@gmail.com>
Subject: 3.19-rc1: peach*: display not working (missing patches)
Date: Tue, 23 Dec 2014 11:16:16 +0100
Message-ID: <20141223101616.GA6238@peachpi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:41809 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755711AbaLWKQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Dec 2014 05:16:20 -0500
Received: by mail-wg0-f49.google.com with SMTP id n12so8663618wgh.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2014 02:16:18 -0800 (PST)
Received: from gmail.com (2-230-238-136.ip204.fastwebnet.it. [2.230.238.136])
        by mx.google.com with ESMTPSA id gu5sm9154248wib.24.2014.12.23.02.16.17
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Tue, 23 Dec 2014 02:16:17 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung <linux-samsung-soc@vger.kernel.org>

Hi,

3.19-rc1 still misses these two patches:

156823e arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
03c16e7 ARM: exynos_defconfig: Enable options for display panel support156823e

and without them, the display doesn't turn on on my peachpi: can we have them
queued for rc2?
-- 
bye,
p.
