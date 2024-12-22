Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C816F27F;
	Sun, 22 Dec 2024 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857069; cv=none; b=QbgyRtlN9NqIaZ70kEukkMwr2ydFJ9ox+ea0aIXAOHHnaocA5eGzHUypZizNxd8KgceDGj7M86DrmRgL0SXvYwRALkFXIBqOFaYdFw6AEEik8zKa5l3IuSnfR52Xw1itamvOY2wL8Cn3gUUo2sUnrN9+SD0ZjlEekx4WHYrevM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857069; c=relaxed/simple;
	bh=vOv3SDR/kqhF+2Wt+FhCJkbZftAkSUP5oWG1y/l48sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxpqF/fCMtdUFie09MM3uMzaTI4eAoErbcA08t5SvXjRT4mYHBQB+/qDiwo35Z+Z6qeUfct/xG0XOuOHQHame1FTIAXrmSwvQFPo+HzuPryeokOYSNupSEBG7MkC95s/Zgmm1a1CbK+4i/7hJL2N79U81nbtn3gYUAwBp5yJufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGthdnDR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGthdnDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E50FC4CECD;
	Sun, 22 Dec 2024 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857068;
	bh=vOv3SDR/kqhF+2Wt+FhCJkbZftAkSUP5oWG1y/l48sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGthdnDRcHBT6b3R4o1mP3UcKjpM+zl5RG5Ukllt/4gA5pEjW0D0vyTHBGZvsU2OA
	 3/45fYgvtiBh60l1l4flqoNHeqX14AETyaT3PUkMxj6gcwfJvgZROkkvL0HY0fskMM
	 IB4tSWOu5kWd8tGV+pi31A5fg+hAptE0GhssY8JhDmdMOZOGHqcyABTpkng5H1BoOH
	 PgMOpigvpfXiC28Kf83cfuKhNxOs7DnD3/88fzxv20kQy4h3qOvP2qNdeDSEAoQIkE
	 7xYkW6/d2V9cOiZgJDjLP6a5CIOrGApq625iYx7ua6dTXxp4ezA28MQLErt5h+8RE4
	 tvpji0NCjYCig==
Date: Sun, 22 Dec 2024 09:44:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v6 1/5] dt-bindings: mailbox: allow #mbox-cells = <0>;
Message-ID: <uj4hxm6ijclixdq7wr5yfa7xnxjrom45ce7iyowf54kebkuelb@24ufqptjlwqg>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
 <20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org>

On Fri, Dec 20, 2024 at 01:49:56PM +0000, Tudor Ambarus wrote:
> There are mailbox clients that can discover the mailbox channel
> identifiers at runtime. For such cases passing the channel
> identifiers via DT is redundant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

