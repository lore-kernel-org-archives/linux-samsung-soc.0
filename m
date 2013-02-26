From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] arm: plat-samsung: check processor type before
	cache restoration in resume
Date: Tue, 26 Feb 2013 10:02:22 +0000
Message-ID: <20130226100222.GQ17833@n2100.arm.linux.org.uk>
References: <1361872613-12040-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:50112 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760078Ab3BZKCb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 05:02:31 -0500
Content-Disposition: inline
In-Reply-To: <1361872613-12040-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

On Tue, Feb 26, 2013 at 03:26:53PM +0530, Inderpal Singh wrote:
> Only cortex-a9 based samsung platforms have l2x0 cache controller. Hence check
> the same before restoring the cache in resume.

Why is this patch soo complicated?  Can't you read the CPUs MIDR register
from assembly code?
