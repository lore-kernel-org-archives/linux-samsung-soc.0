From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: SMDK6440: I2C writes fails
Date: Thu, 24 Jun 2010 12:32:36 +0100
Message-ID: <20100624113236.GA3958@opensource.wolfsonmicro.com>
References: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51401 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754706Ab0FXLci (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 07:32:38 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Wed, Jun 23, 2010 at 11:15:55AM +0530, Naveen Krishna Ch wrote:

> Where should i be looking,

I would suggest looking at the driver and comparing it with the
datasheet.

> Will changing the spin counts work?

I'd expect this to be unlikely.  Note that if we run out of spins we
still go for the 1ms sleep that was being used originally so it's more
likely that there's a bug in the chip when that register is being read
(though this would be surprising) or some other change in your kernel is
causing problems.
