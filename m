Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583921660B;
	Thu, 12 Dec 2024 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024538; cv=none; b=FZ4T1n29uzgKK3zGQVs6D0hio6nixUWqH1ocPINpz+Yq5FZUWw7XUNDmomO3cyxgxRSOYFGxtQXGe1h0NZP/eH2iGApKZVbaHHXBFjdX8GUCa2TtuTNkLCot9+MP7hb1cCWoUuMYirOI19SGI6isxuV2V+iwjI32ase/oDT0b9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024538; c=relaxed/simple;
	bh=SjAQ4AP/yA0fQt0zvQl7Z7VVnHL0A0CkMiaWTCcuSW0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TSx062bKMQVvhktOkfljHb4PmNVK8qSpB9lvQch4ceWMs589BCZ6sI9Y5V9Bu3j5qiuHI1jqbeQOmpoRS7uZZRJMkVuKmcMNT2X+uVCq4ZRCfLafmEW3p1+ThTI43Sca3c2N+EBlidvAe8bnowW8Va9Vz9MnFJB3b2szEs+JARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmQq4gmY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmQq4gmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BEFC4CED3;
	Thu, 12 Dec 2024 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734024538;
	bh=SjAQ4AP/yA0fQt0zvQl7Z7VVnHL0A0CkMiaWTCcuSW0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tmQq4gmY/H3tupf/CEBrMfzv8oveGd32BRzD7J4VK5wYNYRhSFZNYTk9fo/QW8GVl
	 edj77EzB+YvLfBKK9cWjxbwkPneZz6eCzw4ZprPAkumT87q5KEsK4TJRRi056Kiqwe
	 tOurgc286+sQcyF3QLJ680hbjbpVHIfDtu18AjK28SJ/EIwhjX72NtxF01hEormtZ3
	 dMwcVypJHE5jFGNZCd9Oc0+l0A5cHaP8TsYYDHmF1e0jjFrIr5/iQ9C+FITcZTG2Xg
	 3wEyCfi8htNNrrJAudXpjRsg5UKr15SamgUvRQlQ190gqWfV9wGZboMjvXm9hmcmw1
	 JmQGBe+f7LPHA==
Date: Thu, 12 Dec 2024 11:28:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, 
 daniel.lezcano@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, vincent.guittot@linaro.org, 
 kernel-team@android.com, arnd@arndb.de, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, ulf.hansson@linaro.org, 
 andre.draszik@linaro.org, Jassi Brar <jassisinghbrar@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
 <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
Message-Id: <173402453635.2828943.15564980222849076434.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings


On Thu, 12 Dec 2024 15:43:45 +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos Mailbox Controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/mailbox/google,gs101-mbox.yaml        | 79 ++++++++++++++++++++++
>  include/dt-bindings/mailbox/google,gs101.h         | 14 ++++
>  2 files changed, 93 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/google,gs101-mbox.example.dtb: /example-0/soc/mailbox@17610000: failed to match any schema with compatible: ['google,gs101-acpm-mbox']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

