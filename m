From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 0/6] cpufreq: suspend early/resume late
Date: Mon, 25 Nov 2013 12:29:20 -0700
Message-ID: <5293A510.9090307@wwwdotorg.org>
References: <cover.1385374819.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:34303 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756815Ab3KYT30 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 14:29:26 -0500
In-Reply-To: <cover.1385374819.git.viresh.kumar@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, rjw@rjwysocki.net
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, jinchoi@broadcom.com, tianyu.lan@intel.com, sebastian.capella@linaro.org, jhbird.choi@samsung.com

On 11/25/2013 07:11 AM, Viresh Kumar wrote:
> This patchset adds cpufreq callbacks to dpm_{suspend|resume}() for handling
> suspend/resume of cpufreq governors and core. This is required for early suspend
> and late resume of governors and cpufreq core.

Patches 1-3,6,
Tested-by: Stephen Warren <swarren@nvidia.com>

Patch 6,
Acked-by: Stephen Warren <swarren@nvidia.com>

Thanks.
