From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM: move firmware_ops to drivers/firmware
Date: Mon, 18 Nov 2013 11:58:42 +0000
Message-ID: <20131118115842.GE4050@arm.com>
References: <1384678169-28228-1-git-send-email-acourbot@nvidia.com>
 <CAHkRjk5LBOFx3ir49RgEsaFwvp5UCpTjYFWto+URXebAsOP0RA@mail.gmail.com>
 <52898417.80601@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <52898417.80601@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@nvidia.com>, Tomasz Figa <t.figa@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 18, 2013 at 03:05:59AM +0000, Alex Courbot wrote:
> On 11/18/2013 12:59 AM, Catalin Marinas wrote:
> > On 17 November 2013 08:49, Alexandre Courbot <acourbot@nvidia.com> wrote:
> >> The ARM tree includes a firmware_ops interface that is designed to
> >> implement support for simple, TrustZone-based firmwares but could
> >> also cover other use-cases. It has been suggested that this
> >> interface might be useful to other architectures (e.g. arm64) and
> >> that it should be moved out of arch/arm.
> >
> > NAK. I'm for code sharing with arm via common locations but this API
> > goes against the ARMv8 firmware standardisation efforts like PSCI,
> > encouraging each platform to define there own non-standard interface.
> 
> I have to say, I pretty much agree with your NAK.
> 
> The reason for this patch is that the suggestion to move firmware_ops 
> out of arch/arm is the last (I hope) thing that prevents my Trusted 
> Foundation support series from being merged.

Moving it into drivers shouldn't be a workaround. Nice try ;).

> Now if we can all agree:
> 
> * that ARMv8 will only use PSCI

Or spin-table (which does not require secure calls). Otherwise, if
secure firmware is present, SoCs should use PSCI (as the only firmware
standard currently supported in the arm64 kernel).

However, things evolve and we may have other needs in the future or PSCI
may not be sufficient or we get newer PSCI revisions. This can be
extended but my requirement is to decouple booting standard from SoC
support (together with the aim of having no SoC-specific code under
arch/arm64). I really don't see why SoCs can't agree on one (or very
few) standard booting protocol (and legacy argument doesn't work since
the ARMv8 firmware needs to be converted to AArch64 anyway).

> * that there is no use-case of this interface outside of arch/arm as of 
> today (and none foreseen in the near future)

The firmware_ops are only used under arch/arm so far, I don't see any
drivers doing anything with it. Also, l2x0_init is ARMv7 only.

On arm64, support for PSCI is handled via cpu_operations in the latest
kernel. That's an arm64 abstraction and is extensible (but we want to
keep tight control of this, hence no register_cpu_ops function).

> * that the firmware_ops interface is quite ARMv7-specific anyway,

This was introduced to allow SoC code to enable hooks for SoC-specific
firmware calls like cpu_idle, l2x0_init. By standardising the interface
and decoupling it from SoC code on arm64, we don't need per-SoC
firmware_ops.

Of course, trusted foundations interface could be plugged into cpu_ops
on arm64 but I will NAK it on the grounds of not using the PSCI API, nor
the SMC calling convention (and it's easy to fix when porting to ARMv8).
If a supported standard API is used, then there is no need for
additional code in the kernel.

BTW, is legacy code the reason for not converting the SMC # to PSCI?
It's already supported on ARMv7, so you may not have much code left to
merge in the kernel ;).

> * that should a need to move it (for whatever reason) occur later, it 
> will be easy to do (as this patch hopefully demonstrates).

I agree, it's not hard to unify this but so far I haven't seen a good
reason.

-- 
Catalin
