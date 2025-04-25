Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB4188596;
	Fri, 25 Apr 2025 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608931; cv=none; b=a2WWynNI7cIDS5SdDXCWrKyG8K0Qc1jvoxSODVJbYXyrs6c/m3RpujJIoJtAr8x3zyshI6MOOv2jVfpZR1+9pZ3l1qIhNoqmM7AggYBzLxDRUbR8ku2N2tD8rqzQMVDZ2KNwvhb606ch8z7BpQ3xQwCLcCbAl9tNzDRnJ2gU5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608931; c=relaxed/simple;
	bh=Usf2G1h8hpF9rzR/da+RSah9tvDonSHdGdQC9xKTH/A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gq3ufKSrhPU3b5YvHAhoFUtG6e+DG2JD/I4gRBX0Wh2ZIodjIgN2d5LHeLWUQZZQbzDD9Mme98mPl4pqL54nb/f9pPURtXazB3efMHadXmHY/61x94owgExxf6zwou3oI2/t7wgtz8l21O7nRSnB1Rtra1pWZbESnCPvWg2LXD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCe/XvGX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCe/XvGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D60FC4CEE4;
	Fri, 25 Apr 2025 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608931;
	bh=Usf2G1h8hpF9rzR/da+RSah9tvDonSHdGdQC9xKTH/A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZCe/XvGXWMUZHkWQevSYxQop9cUEEguMOyhDx5sTtqL5P0GT4CetGe8EHdbpMUHTF
	 eqs453T6V4TBEQCrnsl+5FPGN2Vo0taSg0du+iAh5BR3sZsmipv0Aqx2z0eF65VAsu
	 C5HTST2Bjc1fEPuinUdHDR/wiPZEei3D6Z765WRmwuVOJ95dH0P6xkQ7n7RhguHRQ9
	 90PeTlSOGSIrQ9VbpFQSym2oRDLSR2eR+UQ0LSXw4tzdzL2xIk+fdrGFLdlNKpJRH/
	 pNTGGDkV/i1u6tlM34Mb/En0nSR6z41hlMXfUo0nMy/FlOoPGAv6YXddd3moU1EaM7
	 TuIFngV2JCjgw==
Date: Fri, 25 Apr 2025 14:22:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: willmcvicker@google.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org
To: Peter Griffin <peter.griffin@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
 <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org>
Message-Id: <174560892936.2854543.3393907207242393219.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: google: Add
 gs101-pmu-intr-gen binding documentation


On Fri, 25 Apr 2025 17:25:05 +0100, Peter Griffin wrote:
> Add bindings documentation for the Power Management Unit (PMU) interrupt
> generator.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu-intr-gen.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

