Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EB24500D;
	Thu, 13 Feb 2025 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470634; cv=none; b=HF8U31m+w97zYsItXURuepHNYLU84EwwAf8mMhSLXCIZ804kEXOyPEFJf8XDcj8ECDlQYUGjzfGi5MiqZtpvfDmP9vCvblxQNOPC05iEKmbgfOUrx7/z7WkWyFr7cNX03evMdJmml6XOM/0+feC5ogTWY6loW6YbI+ggo8bw4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470634; c=relaxed/simple;
	bh=+C2/z6pJuByUZnnepE4JKaFU3dsx4ZrFCxBYWNaFID4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a4BC8jmsCcMPTOD+KkBgTDblzkUx7Hq2E/5WFK+m8GclKCXJWrK2bJ6D8FH07a2LNdbBpu8V8waylpFrv1apOw57TUGzM1hNHFhj0/8a02KruInjwFa5tbR53wI0PLXj/IAKC/y+t095/iBe44YjxbkK5zW6g2YXQRAGNHk69C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJyaI6Te; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJyaI6Te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0883C4CED1;
	Thu, 13 Feb 2025 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739470633;
	bh=+C2/z6pJuByUZnnepE4JKaFU3dsx4ZrFCxBYWNaFID4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VJyaI6TefJxF+QG5APQquNgcp2bi520XL6y2jA1XtvNgblgVB31e/w9p1AD85NxKw
	 v/CC8GQ/dMVRgLUEDXha09uJTkTTfUGh/6TeAD1lYRxeSD2/IixxfdEzNngCjsJ4b/
	 PuhADkbUecCSeGclnbvy5wfDZw8itA4rbgJpQx1IfGf7xfuGC6NrRSzlgDRXlS7TD8
	 s1mJX4T0hsFvcOcNx3vFJn6POUwV0KH1enTuYlaTWoLJoFWQDyAkqocYUIctFKDjdA
	 OX5UwNbKvqYNXFjtbHQK9CKHW5z4OFz/KujZGVG0Gk3rbcgAcsGZs2B57knJMYqEjP
	 a0uBzVqF3SUCA==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, kishon@kernel.org, Sowon Na <sowon.na@samsung.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241226031142.1764652-1-sowon.na@samsung.com>
References: <CGME20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6@epcas2p4.samsung.com>
 <20241226031142.1764652-1-sowon.na@samsung.com>
Subject: Re: (subset) [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
Message-Id: <173947063031.294083.4529476381190055729.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 23:47:10 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 26 Dec 2024 12:11:35 +0900, Sowon Na wrote:
> This patchset introduces ExynosAuto v920 SoC ufs phy driver as
> Generic PHY driver framework.
> 
> Changes from v3:
> - Use lower case for all addresses
> - Add empty line between macro and function
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
      commit: 0ee54dcfe76760a65d86437f66df7f93b8b81903
[2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy driver
      commit: d2317767723b63d28e3b93da92760b7934935536

Best regards,
-- 
~Vinod


