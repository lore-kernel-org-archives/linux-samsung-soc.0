From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ARM: mach-shmobile: Use common always on power
 domain governor
Date: Fri, 2 Dec 2011 00:33:34 +0000
Message-ID: <20111202003333.GC31903@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1322765339-29879-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201112012137.08119.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38752 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755908Ab1LBAdj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 19:33:39 -0500
Content-Disposition: inline
In-Reply-To: <201112012137.08119.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Dec 01, 2011 at 09:37:07PM +0100, Rafael J. Wysocki wrote:
> On Thursday, December 01, 2011, Mark Brown wrote:
> > Saves a tiny amount of code.

> How so?

It saves source code size when we get the second user, by itself you're
right it doesn't achieve anything (except avoiding redundancy once 1/3
gets applied I guess).
