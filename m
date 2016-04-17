From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 4/5] iio: health: afe4404: use regmap to retrieve
 struct device
Date: Sun, 17 Apr 2016 13:07:52 -0500
Message-ID: <5713D0F8.20303@ti.com>
References: <cover.1460314070.git.amsfield22@gmail.com>
 <2dd23e55fa7c2d16c577146eefd4a84046d2b838.1460314070.git.amsfield22@gmail.com>
 <57129101.7000503@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57129101.7000503-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/16/2016 02:22 PM, Jonathan Cameron wrote:
> On 10/04/16 20:07, Alison Schofield wrote:
>> Driver includes struct regmap and struct device in its global data.
>> Remove the struct device and use regmap API to retrieve device info.
>>

Why? This adds nothing but more code to get dev through some
container_of trickery when we could just keep a dev pointer in the data
structure.

Andrew
