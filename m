From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: pl330: Set residue in tx_status callback
Date: Fri, 5 Dec 2014 20:40:14 +0530
Message-ID: <20141205151014.GK3411@intel.com>
References: <1416995095-13763-1-git-send-email-padma.v@samsung.com>
 <CAAgF-BfpU72KTJjVd8jWStD8yJ5sSmXOiQm77xQunO2QhC9ExQ@mail.gmail.com>
 <547DF61D.3010909@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:45802 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750920AbaLEPKK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Dec 2014 10:10:10 -0500
Content-Disposition: inline
In-Reply-To: <547DF61D.3010909@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Padma Venkat <padma.kvr@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, broonie@kernel.org, Dylan Reid <dgreid@chromium.org>

On Tue, Dec 02, 2014 at 06:25:49PM +0100, Lars-Peter Clausen wrote:
> On 12/02/2014 06:38 AM, Padma Venkat wrote:
> 
> Well it doesn't break audio, but I don't think it has the correct
> haviour for all cases yet.
> 
> Again, the semantics are that it should return the progress of the
> transfer for which the allocation function returned the cookie that
> is passe to this function. You have to consider that there might be
> multiple different descriptors submitted and in the work list, not
> just the one we want to know the status of. The big problem with the
> pl330 driver is that the current structure of the driver makes it
> not so easy to implement the residue reporting correctly.

well you can use the completed_cookie as hint. This was last trasaction
which was issues, so calculate remianing bytes for this and subsequent ones
resiude would only be size of transaction

-- 
~Vinod
