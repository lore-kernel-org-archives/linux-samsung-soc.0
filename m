From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: pl330: Set residue in tx_status callback
Date: Thu, 11 Dec 2014 10:17:58 +0530
Message-ID: <20141211044758.GH16827@intel.com>
References: <1416995095-13763-1-git-send-email-padma.v@samsung.com>
 <CAAgF-BfpU72KTJjVd8jWStD8yJ5sSmXOiQm77xQunO2QhC9ExQ@mail.gmail.com>
 <547DF61D.3010909@metafoo.de>
 <CAAgF-BfPyaOhhrA5L8vm2WDnhBYDexJFkGxqL1GsL2TMB8z=Rw@mail.gmail.com>
 <CAJe_Zhd2-vBgAoJsBt7JCOYDuTZrBCScSZ1HaNO3gNTZ-P6A9A@mail.gmail.com>
 <20141205151843.GV11285@n2100.arm.linux.org.uk>
 <CAJe_ZhfDsfehCXHB6pCuQ6672kXBYFxh687cZT1qaSCOyLy76g@mail.gmail.com>
 <20141208130727.GK16827@intel.com>
 <CAJe_ZhfKFdrV8=oMiH0hJeOmGAmPNbZ7rUXsqN+Ak7PvOnZEmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:22677 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbaLKErt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Dec 2014 23:47:49 -0500
Content-Disposition: inline
In-Reply-To: <CAJe_ZhfKFdrV8=oMiH0hJeOmGAmPNbZ7rUXsqN+Ak7PvOnZEmA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Padma Venkat <padma.kvr@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Padmavathi Venna <padma.v@samsung.com>, Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Dec 09, 2014 at 08:48:04PM +0530, Jassi Brar wrote:
> As Russell pointed out, that ain't the case either.
> So we are yet to figure out benefits of having explicit
> issue_pending() after tx_submit().
callback ?

-- 
~Vinod
