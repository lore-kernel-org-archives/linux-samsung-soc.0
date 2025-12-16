Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC033C1B5;
	Tue, 16 Dec 2025 07:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868729; cv=none; b=FDlZe0eEPCrh1xKFFQNhQ9em1OGve5H+ztmmIIhzAQvmfWtvQk0XpaQz8S/b7ndnPs83mQhkFYWeZFoxwLJ0JBJSIR1lFjJvK+xN3uzBhbRiY2UX2SVs4+6x0WwMtCR9OJEFK6604xCQAuSXkbWkxS8ylTB1ig69hXL3NHcq/ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868729; c=relaxed/simple;
	bh=yWT6Th47hFpbIGS7HXZ8aLzlkC3HmltK55X0UShFCTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z1os7jwPDHR0VvQDMkp+eOIvkhauvj5HBguQzmUSsTmjxtt4UQN+KwVV4y4OhY9qU8emiMNN5e7HUy08V7CfbfkDhdTZNRTQZwKoOjpCG5swtcifJIMk2ML/7yecuBpS8TC/TF3ddsGiiGe0n/B6kBJR7aabbXrXs30iM3BeEJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOWApGJh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOWApGJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852C8C4CEF1;
	Tue, 16 Dec 2025 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765868726;
	bh=yWT6Th47hFpbIGS7HXZ8aLzlkC3HmltK55X0UShFCTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JOWApGJhdPElDrwbDqe/1NFc7QdgD6oGFUCTbXGRjDalQ0vKW8hXFOTcKcJ/zgo6N
	 t/xbDC8KB716LUTvUp1YiE9st9BSzXLfzfSilO8+FzBzxuEmpOdTHXdGgfurhI+48x
	 5QBggBukq2gJh6Mt07KdSlUdmqr7L0ND0WVI2K2VYKarIJ5KQb12aEDdQ9p2lkLLBx
	 3Ytyb07jKudeX76iEDzashmJ4+fiuLfF5LSoOZneMSZoq37AN/MGnb3lq7pqiDx819
	 Y5dIo085vkyR/YxvXMZv1cfcI1QU+T5k1POF5HUZ8OXDBbcOlf+8xEaUm6bkQNupDK
	 Mg7V6dQqs6aqw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, willmcvicker@google.com, dan.carpenter@linaro.org, 
 arnd@arndb.de, robh@kernel.org
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
Subject: Re: [PATCH v2 0/2] Remove syscon compatible from google,gs101-pmu
 node
Message-Id: <176586872327.22265.10311318295410886509.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 08:05:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 14 Nov 2025 12:00:15 +0000, Peter Griffin wrote:
> This series removes the syscon compatible from the pmu_system_controller
> node, by updating both yaml bindings and device tree.
> 
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs101-pmu
      https://git.kernel.org/krzk/linux/c/411727d9182d7a067fdd16a125d2069f52e8bb7f
[2/2] arm64: dts: exynos: gs101: remove syscon compatible from pmu node
      https://git.kernel.org/krzk/linux/c/a21d38b5e209c60e73f81e467cc53ad57b5d4080

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

