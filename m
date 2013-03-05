From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] dma: of-dma: return error when 'dma-cells' not found
Date: Tue, 05 Mar 2013 08:56:23 -0600
Message-ID: <51360797.6000007@gmail.com>
References: <1362475531-32260-1-git-send-email-padma.v@samsung.com> <5135BE58.4040105@gmail.com> <1859273.NY466Orvuh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:44855 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752643Ab3CEO43 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 09:56:29 -0500
Received: by mail-pb0-f47.google.com with SMTP id rp2so4530980pbb.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 06:56:28 -0800 (PST)
In-Reply-To: <1859273.NY466Orvuh@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, boojin.kim@samsung.com, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, vinod.koul@intel.com, kgene.kim@samsung.com, jon-hunter@ti.com, padma.kvr@gmail.com

On 03/05/2013 04:15 AM, Arnd Bergmann wrote:
> On Tuesday 05 March 2013 03:43:52 Rob Herring wrote:
>> On 03/05/2013 03:25 AM, Padmavathi Venna wrote:
>>> This patch returns error when 'dma-cells' property not found
>>> in the corresponding device node. With out this change there
>>> is a crash in the generic dma incompatible platforms.
>>>
>>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>>
>> NAK.
>>
>> #dma-cells should be optional. It is not needed for platforms supporting
>> memory to memory transfers only and should therefore be optional. You
>> cannot assume the dtb can be updated and kernel changes need to work
>> with old dtbs. I've submitted patches to address this and fix the crash:
>>
>> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-February/028769.html
> 
> Why would you call of_dma_controller_register() for a dma
> engine that does not support slave channels, when that is the
> only purpose of that interface?

Well maybe then that function should be allowed to fail without erroring
out. I just fixed it a the line that failed. Doing be32_to_cpup directly
on a function return that can be NULL is not correct either.

> Note that the binding defines #dma-cells as required, and it
> does not make any sense otherwise.

The 2nd patch I submitted changes that. It does not make sense to
require it if you have no requests and hence will never have a phandle
reference in a slave device. The simple fact is that the pl330 had an
existing binding that worked for the memory to memory only case and
kernel changes broke this. Kernel changes should not break existing
device-trees.

Rob
