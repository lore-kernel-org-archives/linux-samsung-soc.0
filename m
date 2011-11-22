From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V3 3/6] ARM: exynos: save L2 settings during bootup
Date: Tue, 22 Nov 2011 09:49:25 +0000
Message-ID: <20111122094925.GV9581@n2100.arm.linux.org.uk>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org> <1321954532-18724-4-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41519 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab1KVJtc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 04:49:32 -0500
Content-Disposition: inline
In-Reply-To: <1321954532-18724-4-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Tue, Nov 22, 2011 at 03:05:29PM +0530, Amit Daniel Kachhap wrote:
> This patch adds code to save L2 register configuration at boot, and
> later used to resume L2 before MMU is enabled in suspend and cpuidle
> resume paths.

Is there a reason exynos isn't using the generic l2 code?
