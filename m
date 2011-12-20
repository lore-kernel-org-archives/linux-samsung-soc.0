From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/7] s3c-hsudc: Add regulator handling
Date: Tue, 20 Dec 2011 15:04:56 +0000
Message-ID: <20111220150456.GF29727@sirena.org.uk>
References: <201112191423.21461.heiko@sntech.de>
 <201112191427.07682.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49251 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752408Ab1LTPFC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 10:05:02 -0500
Content-Disposition: inline
In-Reply-To: <201112191427.07682.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko St?bner <heiko@sntech.de>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Mon, Dec 19, 2011 at 02:27:07PM +0100, Heiko St?bner wrote:
> The udc has three supplies: vdda (3.3V), vddi (1.2V) and vddosc (1.8-3.3V).
> Turn these on and off on start and stop calls.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
