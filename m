From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: GIC: Add device tree interrupt specifier
	translation support
Date: Fri, 5 Aug 2011 10:53:18 +0100
Message-ID: <20110805105318.5550e4b5@taxman.wild-wind.fr.eu.org>
References: <1312532353-8772-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1312532353-8772-1-git-send-email-thomas.abraham@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri,  5 Aug 2011 09:19:13 +0100
Thomas Abraham <thomas.abraham@linaro.org> wrote:

> Add support for translation of hardware interrupt numbers specified in device
> tree nodes to linux irq number.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> Notes:
> 1. The translation of SGI/PPI interrupts is supported only for CPU0.

This is a major problem. PPIs could be used differently on different
CPUs, as each CPU basically has its own PPI controller. I don't know if
this "feature" is used in the wild, but there is reason why it couldn't
be used one of these days.

I did have a go at this problem a while ago, as part of a much complex
patch set:

https://patchwork.kernel.org/patch/916362/

Also note that at the moment, PPIs are not really usable as standard
interrupts (because of the whole banking scheme).

Cheers,

	M.
-- 
I'm the slime oozin' out from your TV set...
