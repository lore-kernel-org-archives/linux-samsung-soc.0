From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: increase
 CONFIG_CMA_SIZE_MBYTES to 96
Date: Wed, 1 Mar 2017 20:49:05 +0200
Message-ID: <20170301184905.il4jlr6j6o5ums4y@kozik-lap>
References: <20170228191221.18135-1-shuahkh@osg.samsung.com>
 <20170301170910.4vvn4eeolkjbgzw5@kozik-lap>
 <9fd0a9e7-14da-cd4f-b47c-db9fda295105@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9fd0a9e7-14da-cd4f-b47c-db9fda295105@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: linux@armlinux.org.uk, kgene@kernel.org, javier@osg.samsung.com, arnd@arndb.de, cw00.choi@samsung.com, rafael.j.wysocki@intel.com, robie@justgohome.co.uk, b.zolnierkie@samsung.com, viresh.kumar@linaro.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com, a.hajda@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 01, 2017 at 11:08:52AM -0700, Shuah Khan wrote:
> On 03/01/2017 10:09 AM, Krzysztof Kozlowski wrote:
> > On Tue, Feb 28, 2017 at 12:12:21PM -0700, Shuah Khan wrote:
> >> Current CMA size of 64 Mbytes is right on the edge of being small when
> >> several drivers need to allocate large CMA buffers.
> >>
> >> For example, if the s5p-mfc driver needs to pre-allocate N MiB CMA memory
> > 
> > Everything looks good but I don't get this "N MiB". What do you mean by
> > that? If N is infinite (or not known) then how do you know that 96 MiB
> > will be enough?
> 
> s5p_mfc pre-allocating the default 8MiB at the moment with CMA size of
> 64 Mbytes H.264 1080p video use0case fails. Works with CMA size = 96 Mbytes.
> 
> N in this log meant to cover the deualt case of 8 MiB or any user override
> with s5p_mfc.mem=UserSpecifiedM. If this leads to confusion, we can amend
> it to say "pre-allocate CMA memory"
> 
> Would you like me to amend the changelog with the above change and resend
> the patch?

I get the point. I think the ammended version sounds better but there is
no need to resend. I will rephrase it when applying (after merge
window).

Best regards,
Krzysztof
