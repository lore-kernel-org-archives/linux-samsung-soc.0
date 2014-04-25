From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v8 0/3] Exynos 5410 support
Date: Fri, 25 Apr 2014 15:56:55 -0700
Message-ID: <7hppk5f26g.fsf@paris.lan>
References: <1397459860-21869-1-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397459860-21869-1-git-send-email-t.dakhran@samsung.com> (Tarek
	Dakhran's message of "Mon, 14 Apr 2014 11:17:37 +0400")
Sender: linux-doc-owner@vger.kernel.org
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
> Has been build on Linux Kernel v3.15-rc1
> Has been tested on: 1) Exynos 5410 reference board (exynos_defconfig)
> 		    2) Odroid-XU board (exynos_defconfig)

Tested-by: Kevin Hilman <khilman@linaro.org>

I also boot tested (to initramfs) on my odroid-XU and see the 4 "big"
cores booted.  Presumably I'm still missing the u-boot/firmware magic
for the little cores.

Kevin
