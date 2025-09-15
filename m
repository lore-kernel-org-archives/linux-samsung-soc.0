Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA582D47F6;
	Mon, 15 Sep 2025 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942521; cv=none; b=hR+UkOyRR2E4Yl30DHIEDdFGpY6hD4BfhFbjaSn3zoUkGt7ez25GnUqNURBQahCEA4CJ0p/WaVQ3M6qi5OUwVFlfmr5ATmEWMsB0MxNb/jPfG/usFBuHm5w/AIPvF8K8+t67j7cRCvF9dLOrLKhQpIAyeSWQGgZEiyJshq3C7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942521; c=relaxed/simple;
	bh=O/mnM44tzuvdBUrl/CyJVRM6ZYLrlrkqYwTIqm29UZU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tKP/cib29icPLJV16GuUNlnGLQwW8ddg3QKr/wlrmdjtzOzpqlhrLJDrR6HJRw0GyY93ixltgmOplsyY6Cxh+qBxk2PTLAj9QXHCOAitaG96yBDDFNaOFDhmlWtDH1rDg2W6Hmlm5C/bMjeo+PfNndCtXKSToVBoy0LbDT3reg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4GsmYuo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4GsmYuo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE07C4CEF1;
	Mon, 15 Sep 2025 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757942521;
	bh=O/mnM44tzuvdBUrl/CyJVRM6ZYLrlrkqYwTIqm29UZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u4GsmYuoaQzZElLXxaxCK0gKRH/XZDNwqYk409E42Jh/AiZag78CI8xKJ3kwzT9rX
	 E1ghEo+f3jRCp8y+eVRqwaW8EO39bW6MpL1rwkrVnkl3ZHNxQGKpjZ3hr1BMwQ7Xmc
	 de5fzLZcozznlgblsclHLJVi+675z4SyX4NpZmjmlpRivqrkZTj85JdlSBSznOOyq6
	 +vLxTucV+VwVlrChnnZYoEsx4PwZ+ymybjD0Mb+ZabtZn6ZjIImjUYGoAQAqPLKUyu
	 Yj8Zj1gQRiu/h23jQd/ruB3gy4wY/bfaFdpzwNWN6PPnQIJKUlcI2N73dS2DGncyOI
	 vnI1Qp5OoVcLw==
Date: Mon, 15 Sep 2025 08:21:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-hardening@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, devicetree@vger.kernel.org, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Luck <tony.luck@intel.com>
To: Alexandru Chimac <alex@chimac.ro>
In-Reply-To: <20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro>
References: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
 <20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro>
Message-Id: <175794237027.2496748.5518990883398170186.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Document gta4xl board
 binding


On Sun, 14 Sep 2025 20:43:56 +0000, Alexandru Chimac wrote:
> Add binding for the Samsung Galaxy Tab S6 Lite (SM-P610/SM-P615)
> board.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml:250:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

