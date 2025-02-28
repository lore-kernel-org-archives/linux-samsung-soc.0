Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC051CB51F;
	Fri, 28 Feb 2025 21:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740777265; cv=none; b=hyfLa9DL15cwwt7KQ7HJmfh1xNrLgP/+c6hLzc/+ghGpKLgfP9kZ/CZBS1nQidVBmb9IMvlfb0DqobOeop1Nu4dDo92nB5YeU8wx0IWlvX36cupH9FKD3JyK304FYXkuPQR+wP35sPmthxeQ6pEc2LRYZslSNV4OCq5VzrN+WnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740777265; c=relaxed/simple;
	bh=0/d4OULk9b8bh2/XYAQGNaFdkygRUUKBHCtphcPEouU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MkCBLZL3iu9n7+7FTklP+wkf2xnWcYTMxVJDu6ZN6hzEmogukssyh2yhFPj0/Pd0zD8OSMJd1lc9m2xNGB+OJe+8VBWxxcdFJ67KuZb1XAF2sef5BC1RPA5geT5Q/MwFrPXlkoqLPiKgD8q8ULcHHyvoFecD5hWkURqZMk6G5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDooDC2G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDooDC2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F231AC4CED6;
	Fri, 28 Feb 2025 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740777264;
	bh=0/d4OULk9b8bh2/XYAQGNaFdkygRUUKBHCtphcPEouU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IDooDC2GnM+FW4Sd9a2yMSXvf3X3VfdVim4Id0vVn0lZzhyHJwyVwydMvzPLmCJXt
	 UvbpBAi7gHsuxgoh/rxiC7ubIW/dfAygFkk59espEY08Jmlwhzj4LU5pQLboX++SQo
	 WJKNTMQOwwSMmmRb6lRP0NPcidy/JpxMB5f5508fFcZQamzILX5vz5zdnEZd0nozNW
	 Bkm4M1jVbhBYDrcOhnDUiTVIhBneqVzPPte3sNu6U+zUI2yDgBc5zfrgoWKMx9Tz0v
	 1Z5kzfPnrhSbMg0nDbDMObkWQVEgIaXcCKXnjM4UbCI56CF/egLKhDLrV6Trg7BgrN
	 GBvatut05mWxQ==
Date: Fri, 28 Feb 2025 15:14:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250301-exynos7870-pmu-clocks-v4-1-0f3e73b10db7@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org>
 <20250301-exynos7870-pmu-clocks-v4-1-0f3e73b10db7@disroot.org>
Message-Id: <174077726185.3730179.16075411217823279787.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add clock definitions and
 documentation for exynos7870 CMU


On Sat, 01 Mar 2025 01:08:15 +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI. Document the devicetree bindings as well.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/clock/samsung,exynos7870-cmu.yaml     | 227 +++++++++++++++
>  include/dt-bindings/clock/samsung,exynos7870-cmu.h | 324 +++++++++++++++++++++
>  2 files changed, 551 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/clock/samsung,exynos7870-clock.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml
Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.example.dts:18:18: fatal error: dt-bindings/clock/exynos7870.h: No such file or directory
   18 |         #include <dt-bindings/clock/exynos7870.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250301-exynos7870-pmu-clocks-v4-1-0f3e73b10db7@disroot.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

