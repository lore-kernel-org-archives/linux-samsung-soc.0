From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/2] s3c24xx: fix DMA support for MCI
Date: Wed, 18 Aug 2010 18:04:24 +0300
Message-ID: <1282143866-8068-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:55885 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753414Ab0HRPGc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Aug 2010 11:06:32 -0400
Received: by eyg5 with SMTP id 5so402252eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2010 08:06:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>, anarsoul@gmail.com

This series fixes DMA support for s3c24xx SoCs, now it's
possible to use DMA with s3cmci driver.

In-Reply-To: 
