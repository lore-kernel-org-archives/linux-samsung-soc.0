From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Remove un-used code
Date: Fri, 19 Aug 2011 02:59:55 +0100
Message-ID: <20110819015955.GA1212@sirena.org.uk>
References: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45951 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751906Ab1HSB76 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Aug 2011 21:59:58 -0400
Content-Disposition: inline
In-Reply-To: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Banajit Goswami <banajit.g@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Tue, Aug 16, 2011 at 06:11:28PM +0530, Banajit Goswami wrote:
> Remove un-used backlight code for SMDK6410 board

Is the data actually wrong?  If not it'd seem better to finish hooking
it up properly than to remove it.
