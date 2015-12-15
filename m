From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 16/19] ARM: dts: s5pv210: replace legacy *,wakeup property
 with wakeup-source
Date: Tue, 15 Dec 2015 16:37:51 +0000
Message-ID: <567041DF.5020109@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-17-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50285 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965147AbbLOQhy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Dec 2015 11:37:54 -0500
In-Reply-To: <1445422216-29375-17-git-send-email-sudeep.holla@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-samsung-soc@vger.kernel.org



On 21/10/15 11:10, Sudeep Holla wrote:
> Though the keyboard and other driver will continue to support the legacy
> "gpio-key,wakeup", "linux,input-wakeup" boolean property to enable the
> wakeup source, "wakeup-source" is the new standard binding.
>
> This patch replaces all the legacy wakeup properties with the unified
> "wakeup-source" property in order to avoid any futher copy-paste
> duplication.
>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>


Ping, do you prefer taking via your tree or should I send to armsoc
directly ?

-- 
Regards,
Sudeep
