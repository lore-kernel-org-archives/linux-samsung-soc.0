From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v7 0/3] Exynos 5410 support
Date: Wed, 02 Apr 2014 16:05:25 -0700
Message-ID: <7h7g772uyy.fsf@paris.lan>
References: <1393213435-20863-1-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393213435-20863-1-git-send-email-t.dakhran@samsung.com> (Tarek
	Dakhran's message of "Mon, 24 Feb 2014 12:43:52 +0900")
Sender: linux-kernel-owner@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Tarek Dakhran <t.dakhran@samsung.com> writes:

> The series of patches represent support of Exynos 5410 SoC
>
> The Exynos 5410 is the first Samsung SoC based on bigLITTLE architecture
>
> Patches add new platform description, support of clock controller and device 
> tree for Exynos 5410.
>
> Has been build on Linux Kernel v3.14-rc1 (Samsung kernel,
> 	for-next branch,
> 	commit aaeeda6f57833c7c0e16fef3d76205f36882c21b,
> 	"Merge branch 'v3.15-next/cleanup-samsung' into for-next")
> Has been tested on Exynos 5410 reference board (exynos_defconfig)
>
> I hope, this is enough clean and hasn't any dependencies to go through 
> Samsung tree.

FWIW: boot tested on Exynos 5410 odroid-xu.

Tested-by: Kevin Hilman <khilman@linaro.org>

What's the status of this being queued up for upstream?  Looks like it
just needs to be broken up in to a drivers/clk pull request and a
arm-soc pull request.

Kevin
