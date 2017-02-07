From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] media: s5p-mfc: Fix initialization of internal structures
Date: Tue, 07 Feb 2017 13:27:27 +0100
Message-ID: <299b7bdb-09b0-a5f8-9a7c-45d64c04865b@samsung.com>
References: <CGME20170203140530eucas1p17e9d0bbb29da881bae025e8e3bc7cbbb@eucas1p1.samsung.com>
 <1486130718-25998-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1486130718-25998-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 03.02.2017 15:05, Marek Szyprowski wrote:
> Initialize members of the internal device and context structures as early
> as possible to avoid access to uninitialized objects on initialization
> failures. If loading firmware or creating of the hardware instance fails,
> driver will access device or context queue in error handling path, which
> might not be initialized yet, what causes kernel panic. Fix this by moving
> initialization of all static members as early as possible.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Andrzej Hajda <a.hajda@samsung.com>
