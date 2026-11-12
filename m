Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480865;
	b=I5qr3Iu7OYZpCx5TzsLBWHUtRPys3aeB6Rp3kLZIZGGBig2F0kQ/JLjV4L6gX64e4Sbj
	 MUQTdyQyZgnc971FnCF6Vko4855D+7VyzVVnaSlj2VDkXSyl0IL+zCUj+Pm4a/0jUEhuT
	 YbIGrH/DpbvtadI6pSv/jzprwEidf0+Zwig8kqazR0Qv24gplOYRJ4kNkCE9eKOiigaSX
	 Rx7qxP6acUgEohduUV/eYx5yOsIoov2AuJY2pEYq6JcxcyHLYTDuI7rh7t1rFmkiMTAkY
	 AlIgl7VzKg0oPF+UpvPBh9LYmga4GQc8/FC2asMH1iYSL2niituH/Hpk5o9r0778H7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480865;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=Nzr1i8kmgcqILZlSzSWseg8RY9ufaj9ibgqjyLSLbkg=;
	b=I/5a4B8ulr+WWVUvkIiPHtiqDETQJPqAMykN3eQdQzD2pBmF9HmccSIhEKDkh/IiNfag
	 iiQFFuCzPUmjC8ePjqlA1dsiwNLO3KP5vPzzAO7d2jcwhkbQ32g2uZQi9jGnRYqPRlxCP
	 RAu/4VV6Ml7NjeRrildK7r8T3/vXD6bY6azizzohXQYj7VyxE7eChA4HeBvQWQHHPV5o8
	 QVuhXGV4izaXQ88BlTxTfHhW4kbG+YRSnNLYX+P32DdSQBVBOVwZNoeDeY49VgaopCjlb
	 rXsaNJGCgX6CFHfCeAHZOAZDP1zVqjvclTJSHc68J70kUo78njLJqruZA0edbPETnoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnyaW9fu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E401D606A327;
	Thu, 12 Nov 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnyaW9fu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219031F00A05;
	Thu, 12 Nov 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480864;
	bh=Nzr1i8kmgcqILZlSzSWseg8RY9ufaj9ibgqjyLSLbkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nnyaW9fuM4QMfEs07StEF0ZXXF5G+Pmg+xGPZPoCbCplbHS3SywWWgJowBdyU9Wce
	 ZZxuOVQkxtJ0nZxojNilzoTZH2uH4ZNmwtefwlqvaaFEKA7T+8DkHbVYC9mGuWAI6h
	 atqB1VCCVgovVHA0zWvAexLyzzX+aPFoRB9f+Wg1akpS4586Xp2PiifqrQWrcHqhyT
	 WJEYQtFrVP4sVZa9gAG4L/+eiUSEB8BnAENojDQNLwM2Y6T+Y7H96jt4ZEHfUnk/+x
	 3NooBYNei3UAoCrLdXO8UBaU+YaUDd8ctgtiJalbzqcN9n/3cWLKdHeHI4FLZCCCi+
	 Pk9w1YxvKtgRQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for Samsung Galaxy Tab A 10.1 (2019, 4G)
Date: Thu, 12 Nov 2026 11:54:15 +0100
Message-ID: <179448080494.71722.17775679288828912464.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=krzk@kernel.org; h=from:subject:message-id; bh=/UDUY46rb+THvC5XKdaD5CIzIRZSc9hvKG7hXVQOvHU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9ZrXtBre9ERaktNJORcTcKjnI82iK0zZMGsfr K9VYECADsWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWa1wAKCRDBN2bmhouD 1x7tEACPOvFgrInugGpJchVAQ1S0WkbfrDJM5d/ENDyzsvj2xBvRKrQS2lreM5YGUlfR527J/6W zHwHXN0VGIddV4MuqzdWZ+tyt8Ea+QfvwVmCcmQIWSGMdbdXXyHM4Kb7PDd+qC7zzY1/tkLixCX BgQ6bbUcfo6Gyzd+EZtYXkZ7lkq/PtWMD1azW1PcWJxZg9XX5ZEBj8kO5NNtujBNOlTV7KEN2oC rRpVglv7Vei+fegrCVS2CCSfr75AUhPBPZDzrU5w5dnYZu305QDDdvoiPP01OEgSD+qZ8BAi75H ba6rb/3anG0ar+ErhNe/ks2BGyy0nHFhu7iY0xhIM0oA+qcz04VwueYXXfS//am3zIMGL9XYIel 4Cydfpy4wt/9Gevb13TasmVQ0l/ftjv0gImD+4PstFQMWcrWq+/F5V+XcC5Zxw55LHv1TymeSvz vOhFfPBAlrDqwj9HHXZvLzIjKU5JLqeTUNe+5eKYz9pyT72yqeetzt4HqE3TkrLwAwb4+cMKbaJ 4BbOBl3MxJqqX7dnQfLKQNdGfX/2KBi9LT9dQjXNDQvmY03P+HFRJZCepOwTBY3jJNVZcABK17h TrLfSKv9SIiORuj1cpKOxIjSGy4I5Uywlc2CMkVc1Z3fbWvjyfA0eCBUpjDEjUbUCRH0apnG3D8 +7XQfsA2ExnxCy
 w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 09 Nov 2026 21:02:01 +0000, Umer Uddin wrote:
> This series adds support for Samsung Galaxy Tab A 10.1 (2019, 4G).
> 
> The device trees have been tested with dtbs_check W=1 and scripts/dtc/dt-check-style
> with --mode strict flag and both results in no warnings.
> 
> This initial bringup consists of:
>  * pinctrl
>  * internal eMMC
>  * gpio-keys
>  * simple-framebuffer
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-T515 board
[2/2] arm64: exynos: Add initial support for Samsung Galaxy Tab A 10.1 (2019, 4G)

Both are here:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=a7e7ce777ab5ccb24a4906b79e1a3645e191dc9b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
