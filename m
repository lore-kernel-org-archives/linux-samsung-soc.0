From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V3 2/6] ARM: s5p: remove useless churn in sleep.S
Date: Tue, 22 Nov 2011 09:48:21 +0000
Message-ID: <20111122094821.GU9581@n2100.arm.linux.org.uk>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org> <1321954532-18724-3-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41512 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1KVJsb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 04:48:31 -0500
Content-Disposition: inline
In-Reply-To: <1321954532-18724-3-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Tue, Nov 22, 2011 at 03:05:28PM +0530, Amit Daniel Kachhap wrote:
> This patch cleans up sleep code in preparation for L2 resume code
> and hotplug functions

I wonder whether anyone read the comments in this file before they
changed the section for the code.
        /*
         * sleep magic, to allow the bootloader to check for an valid
         * image to resume to. Must be the first word before the
         * s3c_cpu_resume entry.
         */
