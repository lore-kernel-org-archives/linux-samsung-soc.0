Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A513F176ABF;
	Wed, 26 Jun 2024 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719416906; cv=none; b=A8Vp7KuQc5djcY+95jz/FsqR8E5ORq+/Y8/7NwGrwZ2rLjwwCAay15e2uip9P4BE+Sus8zngzO15RxgqvPPCXR1vzqpZYki3cH2b6xs5/2FQKW8dgBQ46RjtKqlcOKja+GPQWw00nKOhFJ/sPQP7T8nBvEEwdRq62C5k0JqeNS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719416906; c=relaxed/simple;
	bh=7xwExvsEtQoE7N89hQc/J6z0i05gkGebrUaPVCObEFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPX3y+iK+Tx+f+j+JPh0eghr/iXJyT1pPe6OuwNUJtkoEecmvhW+oMAgnROr4lQilhojoJ301GxTtJpgbKD2zJOlAwVSDlFex8No+uexzptFxonjlnWBBDYYDMCRJMEuk8TCRonGQcb9j6zlra8I7yjnocsMZYnWMZjFFVIMacE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HviN61+Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HviN61+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91D7C32782;
	Wed, 26 Jun 2024 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719416906;
	bh=7xwExvsEtQoE7N89hQc/J6z0i05gkGebrUaPVCObEFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HviN61+YBV3eLHyiuRy4LkHEQ41TYCbBKwmC+EQlJITSa3tdk+hdSy18vkGB5xyPt
	 9UHzKpY3b6aWVl2xQjf58xirSIipJgVkBw5P65W7XF4qcC5SZs2sZjvCdsjXyUmtOL
	 zw8GJ5U3eV0cNBD6fvTtuGM146MSDJxGAx37hShelajotSxSEmp+zcv7dtbs7VBh3k
	 3X2uLsNy/eDDZzFKwoRZmEoSps/Kpsf0icPnwuq8d8iOyB7mhqAe7eWt5wybZ6xuFS
	 Ewg5cLQHcbAlnQEvsCK+TL20LtTViYu6bUecyMKn781sbojycNFJvE/1UBZdWxLcwK
	 UDZIxvPMAwTNQ==
Date: Wed, 26 Jun 2024 16:48:21 +0100
From: Lee Jones <lee@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	saravanak@google.com, willmcvicker@google.com,
	semen.protsenko@linaro.org, kernel-team@android.com
Subject: Re: [PATCH v3 0/2] Add syscon of_syscon_register_regmap api
Message-ID: <20240626154821.GE2504017@google.com>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240621115544.1655458-1-peter.griffin@linaro.org>

On Fri, 21 Jun 2024, Peter Griffin wrote:

> Hi Lee, Arnd, Krzysztof, all,
> 
> This series adds support to syscon driver for a new of_syscon_register_regmap()
> api.
> 
> Platforms such as gs101 require a special regmap to access PMU registers, which
> in the existing upstream client drivers are accessed via syscon regmap. This
> issue was partly solved in [1] whereby a custom regmap is created in exynos-pmu
> and a new API exynos_get_pmu_regmap_by_phandle() created.
> 
> One issue with the approach in [1] is that it required client drivers to be
> updated from syscon_regmap_lookup_by_phandle() to
> exynos_get_pmu_regmap_by_phandle() when obtaining the regmap.
> 
> Whilst updating to exynos_get_pmu_regmap_by_phandle() was OK for exynos
> specific drivers, it meant other drivers like syscon-reboot and syscon-poweroff
> which span multiple SoC architectures could not be easily re-used.
> 
> In previous review feedback for USB phy and gs101 poweroff driver Krzysztof
> requested [2] that we take a more generic approach that other SoCs can also
> leverage.
> 
> The new of_syscon_register_regmap() api overcomes this limitation by allowing
> a SoC driver like exynos-pmu to register it's SoC specific regmap with the
> syscon driver. This keeps the SoC complexity out of syscon driver, and allows
> client drivers to continue using syscon_regmap_lookup_by_phandle() as before.
> The solution allows more code re-use and can be used by other SoC archs.
> 
> Notes on probe ordering
> 
> exynos-pmu runs at postcore_initcall, so all but one of the client drivers
> (ufs phy, usb phy, watchdog) run after the regmap is created and registered.
> 
> The one exception to this is pinctrl-samsung driver which is also
> postcore_initcall level. The exynos_get_pmu_regmap() and
> exynos_get_pmu_regmap_by_phandle() have been temporarily left to support
> -EPROBE_DEFER for pinctrl-samsung driver.
> 
> The longer term plan to solve that probe ordering issue is to enable
> fw_devlink for syscon dt properties so they are correctly listed as
> suppliers in /sys/class/devlink. I tested a PoC patch (see below) for
> fw_devlink and that seemed to work fine. Once fw_devlink supports syscon I
> believe exynos_get_pmu_regmap_by_phandle() api could be removed. The main issue
> currently with fw_devlink syscon support is the wide diversity of dt property
> naming currently in use. That was discussed previously here [3]
> 
> 1248a1256,1257
> > DEFINE_SUFFIX_PROP(syscon_phandle, "syscon-phandle", NULL)
> > DEFINE_SUFFIX_PROP(pmu_syscon, "pmu-syscon", NULL)
> 1358a1368,1369
> >     { .parse_prop = parse_syscon_phandle, },
> >     { .parse_prop = parse_pmu_syscon, },
> 
> 
> Note one previous concern from Saravana about syscon potentially probing
> before exynos-pmu driver and it relying on drivers/Makefile ordering. I tested
> this and even if mfd is listed before soc in drivers/Makefile exynos-pmu
> always probes first due to syscon driver not setting a .of_match_table entry.
> 
> Once the syscon and exynos-pmu patchs are queued I will send patches for
> watchdog and ufs phy drivers to switch back to syscon_regmap_lookup_by_phandle()
> 
> Many thanks,
> 
> Peter.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240219204238.356942-1-peter.griffin@linaro.org/T/
> [2] https://lore.kernel.org/lkml/06383015-51b2-4f4c-9fd8-e4f7ce12f44e@kernel.org/
> [3] https://lore.kernel.org/all/CAGETcx-CCpaV7R0O0HpDpoX6KxQBuJiMmKdWA8nDE-5Qj2Sa7g@mail.gmail.com/
> 
> Changes since v2:
>  - Move allocation outside spinlock area (Arnd)
> Link to v2:
>  - https://lore.kernel.org/linux-arm-kernel/20240620112446.1286223-1-peter.griffin@linaro.org/
> 
> Changes since v1:
>  - Collect by tags
>  - Keep syscon lock held for check and adding entry (Krzysztof)
>  - pass pmu_np not np to syscon_node_to_regmap() (William)
> 
> Link to v1:
>  - https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-1-peter.griffin@linaro.org/
> 
> Peter Griffin (2):
>   mfd: syscon: add of_syscon_register_regmap() API
>   soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()
> 
>  drivers/mfd/syscon.c             | 48 ++++++++++++++++++++++++++++++++
>  drivers/soc/samsung/exynos-pmu.c | 38 ++++++++++---------------
>  include/linux/mfd/syscon.h       |  8 ++++++
>  3 files changed, 70 insertions(+), 24 deletions(-)

Applied and submitted for build testing.

If all is good, I'll send out a PR for the other maintainer(s).

Note to self: ib-mfd-soc-samsung-6.11

-- 
Lee Jones [李琼斯]
