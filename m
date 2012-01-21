From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Convert to devm_kzalloc()
Date: Sat, 21 Jan 2012 18:36:04 +0000
Message-ID: <20120121183604.GG10751@opensource.wolfsonmicro.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <4F1AE36E.3070403@gmail.com>
 <20120121175714.GD20505@sirena.org.uk>
 <4F1B0394.8050003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1B0394.8050003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jan 21, 2012 at 07:27:32PM +0100, Sylwester Nawrocki wrote:
> On 01/21/2012 06:57 PM, Mark Brown wrote:

> > TBH I'd rather not change the coding style as well as presumably Ben
> > likes that the way it is.

> If that's Ben's will then let it stay as it is. I don't even dare to propose
> any change ;) It's rather a meaningless detail. I personally like more using 
> variable's name, and I had a feeling it was preferred style in the kernel.

I tend to use the variable myself, but when editing existing code I'm
going to stick with what's there.
