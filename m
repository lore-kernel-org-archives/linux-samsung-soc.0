Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E51157E9F;
	Fri, 13 Dec 2024 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734114387; cv=none; b=Xmh/Lq/KtJjY2rudRw3tiVL8aaB03LxajfEoj0eF4mqTiAIdRMUlWdm6CshgY41BhMZeNsHbcsG5hbXx4G4IR9QhFsEeXXk0CTjidFFCaysfbi/H+ZSM+lXXnNN1Pvdk/eVJklt8iqaP0sFGdYrGAuKZIZUD8Qx8v2OxeeFqXdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734114387; c=relaxed/simple;
	bh=4QlQ8Ys8G2MWmjm47JxPe6RF3jcZXqGLZ9LhHvUiEYw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CJ6RXUqB31v5po7TiNxvWMFOwNPaeIjAWwHGHmZKQ7DCsqlLgWZY00VowebiZXvLg9XhM5E/XxHA4BYhIO7VnEZdJtUuS/wHCSIaSxaaxaaktSN3BY2hjPMUAN8qLqyDswdCYvt6qSZ7x5zzbuZMf5k6IM70R6o56WShRR65xa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l80XU+ez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l80XU+ez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D661C4CED0;
	Fri, 13 Dec 2024 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734114387;
	bh=4QlQ8Ys8G2MWmjm47JxPe6RF3jcZXqGLZ9LhHvUiEYw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l80XU+eziWwpelejTM/N5sXcHPuLiJKP62nQeM7hEPk45myreewJlbvwH7+PcWozZ
	 sWpq5HQtC9PPIOg2m3p5wYw/JO3EiGtuNajgUiUJmqhfz0rsjJTG5rd+bRraxN9IT5
	 aB9FzHXvb8B8gyYbqJ/ulSywHaQx6Ms9pVEpmJZnDi3ewVk1Tt7LLtJ2VPOBx+p6BD
	 g8W9d/IPe+TJVuYuIbwN0uNgoQsnCgY2ZzsVuCAEUrRNS2mTvn7xxhU5vRDx9m4Npz
	 o0DYxrvbxIMELDA9hinjFLEb+OQOiQNsrwRmGHMXKrzf9/OeCLoDp2Dyml9vjDyl8X
	 YroHa82/vvJjQ==
Date: Fri, 13 Dec 2024 12:26:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, 
 linux-arm-kernel@lists.infradead.org, kernel-team@android.com, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
Message-Id: <173411438555.1847522.16456703753774291235.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions
 for gs101-pmu


On Fri, 13 Dec 2024 16:44:39 +0000, Peter Griffin wrote:
> To avoid dtschema warnings allow google,gs101-pmu to have
> two reg regions.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> I don't really like this patch, but also didn't want to submit the series
> with a dtschema warning ;-)
> 
> Possibly a better solution is when Robs patch
> `mfd: syscon: Allow syscon nodes without a "syscon" compatible` [1]
> 
> gets updated with a v2, we could remove syscon compatible from
> gs101.dtsi (an ABI issue). If I understood his patch correctly,
> it would mean this yaml update would then no longer be required.
> 
> Let me know your thoughts
> 
> [1] https://lore.kernel.org/lkml/20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org/T/#m5ad1ed5c69f693d2a5cc54342a87fbdf3df756d2
> ---
>  Documentation/devicetree/bindings/mfd/syscon-common.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/syscon-common.yaml:68:3: [error] syntax error: expected <block end>, but found '?' (syntax)
./Documentation/devicetree/bindings/mfd/syscon-common.yaml:69:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/syscon-common.yaml: ignoring, error parsing file
make[2]: *** Deleting file 'Documentation/devicetree/bindings/mfd/syscon-common.example.dts'
Documentation/devicetree/bindings/mfd/syscon-common.yaml:68:3: expected <block end>, but found '?'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/mfd/syscon-common.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/mfd/syscon-common.yaml:68:3: expected <block end>, but found '?'
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

