From: Denis Kuzmenko <linux@solonet.org.ua>
Subject: Re: [linux-next] make  s5p64x0_defconfig build error
Date: Thu, 15 Dec 2011 01:30:13 +0200
Message-ID: <4EE93185.9030502@solonet.org.ua>
References: <1323838630.18517.1.camel@phoenix> <20111214123244.GE7122@mudshark.cambridge.arm.com> <20111214191205.GF14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:52944 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755612Ab1LNXcN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Dec 2011 18:32:13 -0500
In-Reply-To: <20111214191205.GF14542@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Will Deacon <will.deacon@arm.com>, Axel Lin <axel.lin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 12/14/2011 09:12 PM, Russell King - ARM Linux wrote:
> On Wed, Dec 14, 2011 at 12:32:44PM +0000, Will Deacon wrote:
>> On Wed, Dec 14, 2011 at 04:57:10AM +0000, Axel Lin wrote:
> So... unless things change, we can expect Gemini, almost all Samsung
> stuff, shmobile, vt8500, and Telechips TCC8k to be at least broken at
> the next merge window.

Mini2440 march (s3c24xx platform) is not broken in v3.2-rc5. Does that
mean that s3c24xx is untouched by this issue or this means that I should
use linux-next?
If this problem is related to s3c24xx I'm ready to do my best for saving
that platform from being removed.

-- 
Best regards, Denis Kuzmenko.
