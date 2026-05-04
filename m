Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0936493C;
	Mon,  4 May 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916898; cv=none; b=nV8O3Ik6NjNJ4mjs5Ux5X9FOtsYQNaz3DdEpxdOxMqpVZuZ7YekLQyTraYQTPBrSi2nINP9XlwByEUNECrVgwi5niQmQq0MHPjPX4nEoXPFJipDYyfIvjUXBFE65AWiu/DtSZneVrQoGiPp/9+lvV+h+NX750Gx+BCaUN8WGZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916898; c=relaxed/simple;
	bh=Gn59W2rZKGmYdbBqCGg8RqnxgppGZjElxUC6lD8BqGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r3i/Lubcat4YhkplsLa2U9P0KLyRu35Qx8wXcTvAVDxmJMN5geodaANape1VBLtjEC+EjMlCKCnV6vz/hrMSP0RFn4tcKlPE+t3uNkEpUDlpaI/+BFyo5EK2bosDJZHyr8gNU7jLUZ7l7cRhKplGeaRHmJKcHAvoZEZIEi5TzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfAZQkfc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfAZQkfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55D3C2BCC4;
	Mon,  4 May 2026 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916897;
	bh=Gn59W2rZKGmYdbBqCGg8RqnxgppGZjElxUC6lD8BqGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HfAZQkfcVirmU8V5cCQecXzwgkWEEpgqOunXPDJ10GZl1RN5qDfynN0VBOC/mDmcn
	 0AgRd/7R2JYROR2inqMjk+lDGVU1fHAjXgkAch/XuU93x2h4wrLKqosl2E83pjx2UB
	 EWO4gupewhcvk3iidpddamYOFpvJ2Bmlg22KeXS+HWEMfGiwowLNgfUt9777KLt1b0
	 BIiXSI3/pR8JV19cVExvK7ce0GzChWiXZAWPB6g8uzp7isHh3sh3dl9YSgkVhqvKMN
	 6XZwmkvpDFjEc/sWtYdNX5xnaibM2xjpJXLiiGkH28SC7H4AYzCHqMgqSUBQrnTN4h
	 aHTIBPm7SqaEg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
References: <20260427143546.3098519-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
Message-Id: <177791689555.723297.3718755834253737201.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 27 Apr 2026 16:35:27 +0200, Arnd Bergmann wrote:
> 


Applied, thanks!

[1/1] ARM: s3c: use gpio lookup table for LEDs
      https://git.kernel.org/krzk/linux/c/b64cbd3f5d96b143fa9f21d84d381b1bb286339c

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

