From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFC 1/5] regulator: core: Get voltage from parent if not available
Date: Wed, 30 Jul 2014 11:01:23 +0200
Message-ID: <53D8B463.5060405@collabora.co.uk>
References: <1406651339-28901-1-git-send-email-javier.martinez@collabora.co.uk> <1406651339-28901-2-git-send-email-javier.martinez@collabora.co.uk> <20140729182601.GA17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140729182601.GA17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/29/2014 08:26 PM, Mark Brown wrote:
> On Tue, Jul 29, 2014 at 06:28:55PM +0200, Javier Martinez Canillas wrote:
>> Load switches are modeled as regulators but they just provide
>> the voltage of their parent input supply. So the drivers for
> 
> Applied, thanks.  The term "load switch" is a bit unusual - they're
> usually just called switches (or sometimes FETs since that tends to be
> the implementation).
> 

Thanks, I used the terminology from the tps65090 data manual [0] that refers
these components as "load switches" all around the document. Although they are
called FETs indeed in the tables and register names.

Best regards,
Javier

[0]: http://www.ti.com/lit/gpn/tps65090
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
