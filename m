From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/3] video: s3c-fb: Rearrange the elements in platform
 data
Date: Sat, 3 Mar 2012 16:30:01 +0000
Message-ID: <20120303163000.GA1495@sirena.org.uk>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34414 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752781Ab2CCQaD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Mar 2012 11:30:03 -0500
Content-Disposition: inline
In-Reply-To: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jg1.han@samsung.com, ben-linux@fluff.org, patches@linaro.org

On Sat, Mar 03, 2012 at 09:20:05PM +0530, Thomas Abraham wrote:
> This patchset rearranges the elements in the platform data of the s3c-fb
> driver with the intent of adding device tree support to the driver in
> subsequent patches.

It seems somewhat surprising that none of these updates touch any
platform data for any existing machines - are no machines using any of
the features being updated?
