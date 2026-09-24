Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE93C13E5;
	Thu, 24 Sep 2026 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260309; cv=none; b=CwiZfROxG6WNkaC7la1IuUwx5XNOWJqF1dUznTZOX+xpgwjVy2y8ByZSHMJkO5Gtm0eazFGEMROKSSwu+bVkhkJn3fa6pqwN6ZN7Q9dEi7nuTjHVtd8xuY8adyno/i8942kOBrxFiys9MZ+r5nXPsh62MpyShHbqqruhd3tJmdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260309; c=relaxed/simple;
	bh=zOWLqYD0InrLBg0MSxhSUUEjROeDH29nsvePoQKNcFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tjr4KzkMwE7mCh2NWeHbtTCe2Kx9YOjljLyfVBRZiOygANQriLh67rgLNyU84LLkCIQra5bTJfcAL/0ZqgZc8DW1rxMGZx0hqnWayqsXzgBa7almS48p4GX0KfJXBsJXN2+s25mlaOODpOsD7W2hh5PA/Vj/PFFs7GuZM3RFoYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8nk/uPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8nk/uPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656931F000FF;
	Thu, 24 Sep 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790260308;
	bh=pYNjvd/2ERa9wydRIjhNaFW2WIR4a5dXOxBa91tembI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P8nk/uPuRYrbb4TkvyojEB46Dr+thIkokQNKVSLXRDtHdr3k5z8tskzU56TBHPuo8
	 0Ba0/IT9ma9lTxNG4Ee+sYOtU+wv3KvY+eSx+VwZcRiDGDSUdX089fZtGQYmkLC2SR
	 5bHW2zNbPyAHuZs7tmiWLxsvk/fpkTiyYvr7RSk/+S2R250lzo/uKJXU+xH88HB0KJ
	 j8eeSpfm8xO8leH4lx+VAauuh2Wf73AVzMNLwqlIUIbD2cwq3VCLp0PmE41dWSBWIe
	 SyVqo0Npt6GlBrMctbEy0MzJZdW4Dh2YhMcKNPwpDodXAx/FOofbDapgofC37rw/OM
	 VHevj+R4mNRHA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, support.opensource@diasemi.com, 
 mazziesaccount@gmail.com, andre.draszik@linaro.org, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: krzk@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20260924103046.1709181-1-hemanth.selam@gmail.com>
References: <20260924103046.1709181-1-hemanth.selam@gmail.com>
Subject: Re: (subset) [PATCH v6] mfd: Fix typos in comments
Message-Id: <179026030615.642175.16947130180520037681.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:31:46 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 24 Sep 2026 16:00:46 +0530, Hemanth Selam wrote:
> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
> 
> Only touches comments, no code changes.

Applied, thanks!

[1/1] mfd: Fix typos in comments
      commit: fabc98ef4665b3b2a506b445c0ae3733caaaacea

--
Lee Jones [李琼斯]

