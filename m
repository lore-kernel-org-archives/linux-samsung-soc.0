From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] video: s3c-fb: Add device tree support
Date: Tue, 10 Jan 2012 04:52:20 +0000
Message-ID: <20120110045219.GA5433@sirena.org.uk>
References: <1326139307-25112-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50531 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756074Ab2AJEwb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 23:52:31 -0500
Content-Disposition: inline
In-Reply-To: <1326139307-25112-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-fbdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, FlorianSchandinat@gmx.de, jg1.han@samsung.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, patches@linaro.org, linux-arm-kernel@lists.infradead.org

On Tue, Jan 10, 2012 at 01:31:47AM +0530, Thomas Abraham wrote:

> +Required properties:

> +- gpios: The gpios used to interface with the external LCD panel.

This isn't terribly informative for the user - which GPIOs and in what
order are they specified?  Looking at the code it looks like pin mux
configuration so just some wording saying it's a list of pins to be used
for the framebuffer function.
