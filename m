Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC01BBBE5;
	Tue,  6 Jan 2026 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767688594; cv=none; b=EGuA3tOOIt3XH148r5g4G/PjHHCtZfUU4ndhH66oQExA1yno7Q7NnUg00NWOUWqurJJcZ5HRwvJC/h0TT4kq01aNatHYDKF8J+jCxjcB01EAe9c21xsHG9weZtOg+gVNV4u/EjU7GlTEolHjAVgBLxvFyC9WJdsETB1xM0Sakhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767688594; c=relaxed/simple;
	bh=U00KxS3/ZhhNiYqvWFcBYyPf4dVD0BanaZcaPOSnAS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BJrHY8xJNJJbVn90x4IvZCVCUu3HLTAINhCB0Yc3I6yR9OnkcQbDKjWlEVg5CvEuU+Vw081gyBAr3CBhfgH17R/XuS0kjlvdw7Ddh51uvSEFzbAQ2uxRJrpEoSvWN4utkbIdDenzqVbxAkt9S1vX2ErFzRArFp9en04D85yRTVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkvixbXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkvixbXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9893C116C6;
	Tue,  6 Jan 2026 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767688592;
	bh=U00KxS3/ZhhNiYqvWFcBYyPf4dVD0BanaZcaPOSnAS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MkvixbXQ0QRrU3U/nQUdVMvCJc+09gEH31nQVeU5pbdKLyWFOHxGwhUjRjmTJEf/J
	 B8IF5K8mh4CkOdnQF9npWQAvQBWoNSPbEx+ekHlWDFvR494xTmWqc5CFop03v4T+Cx
	 T1cQ7T6h7nEX6WxbHyS9jOuFljPVnUAYOV9+T4VT+uKmaMMgoGtZk73c+SheRFhFP9
	 D/wzWFdPW9sxONPA5MbfL0lEso3UlVShNf2X+7LG8tGSV21mlulOPrL+kvq1P12BVw
	 jnALxFHDz1hSl90HMjTmnXhNBwvNN/Jg1Qp9LUKKPuDEbmtGEvdjemBNZFj82TeNBL
	 ZjjzFxn0/Xr4g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260105212858.3454174-1-robh@kernel.org>
References: <20260105212858.3454174-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Drop
 unnecessary select schema
Message-Id: <176768859059.30458.3102029260720066018.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 09:36:30 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 05 Jan 2026 15:28:57 -0600, Rob Herring (Arm) wrote:
> The "select" schema is not necessary because "syscon" compatible is already
> excluded from the default select logic.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select schema
      https://git.kernel.org/krzk/linux/c/4acd805157102eef1b98794450d2e599c7497542

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

