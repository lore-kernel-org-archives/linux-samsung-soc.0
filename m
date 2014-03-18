From: Francois Romieu <romieu@fr.zoreil.com>
Subject: Re: [PATCH V3 2/8] net: sxgbe: add basic framework for Samsung 10Gb
 ethernet driver
Date: Tue, 18 Mar 2014 01:00:09 +0100
Message-ID: <20140318000009.GA18112@electric-eye.fr.zoreil.com>
References: <00bf01cf4221$95373150$bfa593f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from violet.fr.zoreil.com ([92.243.8.30]:56200 "EHLO
	violet.fr.zoreil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751200AbaCRAAb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 20:00:31 -0400
Content-Disposition: inline
In-Reply-To: <00bf01cf4221$95373150$bfa593f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Byungho An <bh74.an@samsung.com>
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davem@davemloft.net, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com, ilho215.lee@samsung.com

Byungho An <bh74.an@samsung.com> :
[...]

Please don't use net_device.{irq, base_addr} fields. They ought to be
considered legacy.

-- 
Ueimor
