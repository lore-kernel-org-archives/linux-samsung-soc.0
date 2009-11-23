From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/6] SMDK6410 SPI: Added spidev support as an example
Date: Mon, 23 Nov 2009 13:43:32 +0000
Message-ID: <20091123134331.GF24326@rakim.wolfsonmicro.main>
References: <1258771948-14276-1-git-send-email-jassi.brar@samsung.com>
 <20091123132320.GB3987@sirena.org.uk>
 <1b68c6790911230541l55697438gbb4b22bddc57868b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37018 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750789AbZKWNn0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2009 08:43:26 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911230541l55697438gbb4b22bddc57868b@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jassi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org

On Mon, Nov 23, 2009 at 10:41:40PM +0900, jassi brar wrote:

> Also, i anticipate objections to the utility of a spidev device when
> smdk6410 doesn't even have convenient pins to tap the SPI signals.

It does have the expansion ports under the LCD, though.
