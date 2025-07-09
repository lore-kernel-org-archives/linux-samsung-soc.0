Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E1EEB3;
	Wed,  9 Jul 2025 02:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752026430; cv=none; b=j2yMhlEEHrDWaO8Glgt7bXoOfOwDNKNh27JQKq7jhkz6NKfMyEpZhKUTov2hu97DmwoJryrjydI6yzCAUfBglryAVgpErtWBnID9gqLYzRsxxS16eQeHKVh/TWgF5ljlqIMmlQxe5a4xihAP8Zyrrjed9cF44nbQ+yQYc4fvCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752026430; c=relaxed/simple;
	bh=SCd2Rskvq412sYYjzoMaYjBEDDWKuLbV0h++4NRJ7Hs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MzWFdmobLpV3ozhmSog5jMxqQv3Quh60KD8LQ99+eDGYTMuSFFKtOvu9vo5a7tajhVhkHwG7GMu+WbmNKGMXIMvzB9EIL12b5z5IrowO2cQwl7iZo4xmu7XAV0WokzkOpjvBUfE+x2XklRN8k6M/vlUVMGt7Gf7rgj2aAw5hr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPp/d4xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPp/d4xm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614DFC4CEED;
	Wed,  9 Jul 2025 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752026429;
	bh=SCd2Rskvq412sYYjzoMaYjBEDDWKuLbV0h++4NRJ7Hs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vPp/d4xmieKxl3KV4U+NXVMO0UtLsKDJYyTkoEpjqNWtAzrJyoM/zofD8TJXrbAPm
	 SWnAnNcwkdNkA/zFbs1EHhiobFGc3f3wk9LJM303f27o49ETNfZRnriXDIL5rX7/tB
	 UO9TKqLMhcq1N2vtM72KRIBoasNtxtoyas7T35Rz96orCLumUejoob5PinY1+cmdtb
	 Dfw93GcD1O1epJevRBYtH+tuGkhau9TpxKvsp4S2GL66e5OVjBRcOMSxChCkLKzTqK
	 J6Vg3BY7OhyWCFMaV+1F6ikOwi82usmJmxaYfqGD4hZ9aszzXiGqy9hcmb72CVO8SB
	 YYaXQi7gnQ5BA==
Date: Tue, 08 Jul 2025 21:00:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 
 krzk+dt@kernel.org, s.nawrocki@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com, 
 broonie@kernel.org
To: ew kim <ew.kim@samsung.com>
In-Reply-To: <20250709001239.379695-1-ew.kim@samsung.com>
References: <CGME20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19@epcas2p2.samsung.com>
 <20250709001239.379695-1-ew.kim@samsung.com>
Message-Id: <175202642853.1975547.14734415377016191511.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Add samsung,abox-generic document


On Wed, 09 Jul 2025 09:12:39 +0900, ew kim wrote:
> Add soundcard bindings for the abox generic of exynus automotive.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../bindings/sound/samsung,abox-generic.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:43:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:43:21: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: maintainers:0: {'name': 'Eunwoo Kim', 'email': 'ew.kim@samsung.com'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: properties:ranges: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/samsung/abox-generic.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dts:26.11-18: Warning (ranges_format): /example-0/abox_generic@generic:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dts:18.44-27.11: Warning (unit_address_vs_reg): /example-0/abox_generic@generic: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dtb: abox_generic@generic (samsung,abox_generic): ranges: True is not of type 'object'
	from schema $id: http://devicetree.org/schemas/soc/samsung/abox-generic.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250709001239.379695-1-ew.kim@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

