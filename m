From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] max8997: Avoid spaces in regulator names
Date: Tue, 24 Jan 2012 20:02:46 +0000
Message-ID: <20120124200246.GA1135@opensource.wolfsonmicro.com>
References: <1327404672-5459-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46495 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755698Ab2AXUCt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 15:02:49 -0500
Content-Disposition: inline
In-Reply-To: <1327404672-5459-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: myungjoo.ham@smasung.com, linux-kernel@vger.kernel.org, rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rnayak@ti.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>

On Tue, Jan 24, 2012 at 12:31:11PM +0100, Karol Lewandowski wrote:
> max8997-pmic instantiated from device tree uses names, not numerical
> ids to distinguish between outputs.
> 
> Replace spaces with underscores in said names to make it possible to
> describe these outputs as regulators in DTS.

I went ahead and applied this since even if there's a better solution
out there this will work for now and the worst it's going to do is make
the log messages a bit less pretty.

Please when sending patches try to use subjects appropriate for the
subsystem - in this case a regulator: prefix.
