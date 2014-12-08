From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] dmaengine: pl330: Set residue in tx_status callback
Date: Mon, 8 Dec 2014 14:23:21 +0000
Message-ID: <20141208142321.GE11285@n2100.arm.linux.org.uk>
References: <1416995095-13763-1-git-send-email-padma.v@samsung.com>
 <CAAgF-BfpU72KTJjVd8jWStD8yJ5sSmXOiQm77xQunO2QhC9ExQ@mail.gmail.com>
 <547DF61D.3010909@metafoo.de>
 <CAAgF-BfPyaOhhrA5L8vm2WDnhBYDexJFkGxqL1GsL2TMB8z=Rw@mail.gmail.com>
 <CAJe_Zhd2-vBgAoJsBt7JCOYDuTZrBCScSZ1HaNO3gNTZ-P6A9A@mail.gmail.com>
 <20141205151843.GV11285@n2100.arm.linux.org.uk>
 <CAJe_ZhfDsfehCXHB6pCuQ6672kXBYFxh687cZT1qaSCOyLy76g@mail.gmail.com>
 <20141208130727.GK16827@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:45271 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755046AbaLHOXg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 09:23:36 -0500
Content-Disposition: inline
In-Reply-To: <20141208130727.GK16827@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Padma Venkat <padma.kvr@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Padmavathi Venna <padma.v@samsung.com>, Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Dec 08, 2014 at 06:37:27PM +0530, Vinod Koul wrote:
> I actually like the split model, you can also prepare txn ahead of time and
> submit them when needed.

Actually, you can't - that's not permitted.  I have email(s) from Dan
explicitly stating that it is permitted for a driver to take a spinlock
in their prepare callback, and release it when the descriptor is
submitted.  Several DMA engine drivers (particularly those in for
async_tx) do exactly that.

The reason that submit is separate from prepare is to allow DMA engine
users to set a callback - if it weren't for that, there wouldn't be a
submit step, prepare would have done everything.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
